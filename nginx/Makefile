all: build run

build:
	docker pull ubuntu:latest
	fig build

run:
	fig run --rm server

clean:
	fig kill
	fig rm --force

push:
	echo "Pushing: docker push renegare/nginx:${VERSION}"
