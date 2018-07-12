.PHONY: build-sniper run-sniper-it build-demo run-demo \
	build-sniper-3000 run-sniper-3000-it build-sniper-3000-demo run-sniper-3000-demo

build-sniper:
	nvidia-docker build -t sniper-cuda ./docker
run-sniper-it:
	nvidia-docker run -it --rm --name=sniper sniper-cuda
build-demo:
	nvidia-docker build -t sniper-demo ./docker-demo
run-demo:
	nvidia-docker run \
		--rm \
		--name=sniper \
		-v $(pwd)/mount/out:/root/out \
		sniper-demo \
		python demo.py
run-demo-it:
	nvidia-docker run \
		--rm \
		-it \
		--name=sniper \
		-v $(pwd)/mount/out:/root/out \
		sniper-demo

build-sniper-3000:
	nvidia-docker build -t sniper-3000 ./docker-3000
run-sniper-3000-it:
	nvidia-docker run -it --rm --name=sniper-3000 sniper-3000

build-sniper-3000-demo:
	nvidia-docker build -t sniper-3000-demo ./docker-3000-demo
run-sniper-3000-demo-it:
	nvidia-docker run -it --rm --name=sniper-3000-demo sniper-3000-demo
run-sniper-3000-demo:
	xhost +local:root
	nvidia-docker run -it --rm --name=sniper-3000-demo sniper-3000-demo \
	mkdir vis_result && python demo.py
run-sniper-3000-demo-3k:
	xhost +local:root
	nvidia-docker run -it --rm --name=sniper-3000-demo sniper-3000-demo \
	mkdir vis_result && python demo_3k.py

AWS_IMAGE := hal9zillion/sniper-3000-auto:sniper-3000-demo

run-sniper-3000-demo-aws:
	# xhost +local:root
	nvidia-docker run \
		-it \
		--name=sniper-3000-demo \
		--mount type=bind,source=$(pwd)/demo_scripts,target=/root/SNIPER/demo_scripts \
		-v $(pwd)/vis_result:/root/SNIPER/vis_result \
		$(AWS_IMAGE)
		# -v $(pwd)/demo_scripts/demo_3k_video.py:/root/SNIPER/demo_scripts/demo_3k_video.py \
		# mkdir vis_result && bash
		# mkdir vis_result && python demo_3k.py
