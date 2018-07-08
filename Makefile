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
run-sniper-3000-demo:
	nvidia-docker run -it --rm --name=sniper-3000-demo sniper-3000-demo
