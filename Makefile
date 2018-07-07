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