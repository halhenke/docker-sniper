.PHONY: build-sniper run-sniper-it build-demo run-demo \
	build-sniper-3000 run-sniper-3000-it build-sniper-3000-demo run-sniper-3000-demo

AWS_IMAGE := hal9zillion/sniper-3000-auto:sniper-3000-demo
PWD := $(shell pwd)
VID_FILE := vids/trimmed_video2.mp4

.PHONY: build-sniper-master-base
build-sniper-master-base:
	docker build -t hal9zillion/sniper-master:base ./docker-master
.PHONY: build-sniper-master-demo
build-sniper-master-demo:
	docker build -t hal9zillion/sniper-master:demo ./docker-master-demo
.PHONY: build-sniper-3000-base
build-sniper-3000-base:
	docker build -t hal9zillion/sniper-3000:base ./docker-3000
.PHONY: build-sniper-3000-demo
build-sniper-3000-demo:
	docker build -t hal9zillion/sniper-3000:demo ./docker-3000-demo

.PHONY: run-master
run-master:
	docker run \
		--rm \
		--runtime=nvidia \
		--name=sniper \
		-v $(PWD)/mount/out:/root/out \
		hal9zillion/sniper-master:demo \
		python demo.py

.PHONY: run-master-it
run-master-it:
	docker run \
		--rm \
		-it \
		--runtime=nvidia \
		--name=sniper \
		-v $(PWD)/mount/out:/root/out \
		hal9zillion/sniper-master:demo


# sniper-3000-demo-3k-setup:
# 	mkdir bin \
# 	&& wget -P bin https://www.iterm2.com/utilities/it2dl \
# 	&& chmod a+x ./bin/it2dl \
# 	&& cp vis_result/py/demo.py . \
# 	&& cp vis_result/py/linear_classifier.py demo/


.PHONY: run-sniper-3000-demo-3k-rm
run-sniper-3000-demo-3k-rm:
	docker run \
		-it --rm \
		--runtime=nvidia \
		--name=sniper-3000-demo \
		hal9zillion/sniper-3000:demo

.PHONY: run-sniper-3000-demo-3k
run-sniper-3000-demo-3k:
	docker run \
		-it \
		--runtime=nvidia \
		-v $(PWD)/mount/in/demo/image:/root/SNIPER/demo/image \
		-v $(PWD)/mount/out:/root/SNIPER/vis_result \
		--name=sniper-3000-demo \
		hal9zillion/sniper-3000:demo

.PHONY: run-master
attach-sniper-3000-demo-3k:
	docker exec \
		-it \
		sniper-3000-demo \
		bash

stop-sniper-3000-demo-3k:
	docker stop \
		sniper-3000-demo

rm-sniper-3000-demo-3k:
	docker rm \
		sniper-3000-demo

start-sniper-3000-demo-3k:
	docker start \
		sniper-3000-demo
