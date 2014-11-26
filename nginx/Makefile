REPO = renegare
NAME = $(shell basename `pwd`)
VERSION = latest

all: build push

build:
	docker pull ubuntu:latest
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):latest .

push:
	docker push $(REPO)/$(NAME):$(shell docker run --rm=true -t $(REPO)/$(NAME) echo `nginx -v 2>&1 | sed 's/[^0-9\.]//g'`)
