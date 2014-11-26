REPO = renegare
NAME = $(shell basename `pwd`)
CMD = /bin/bash

all: build build-version push

build:
	docker pull $(REPO)/$(NAME)
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):latest .

build-version: export VERSION=$(shell docker run --rm=true -t $(REPO)/$(NAME) php -v | grep -m 1 PHP | sed 's/PHP \([^ -]*\).*/\1/')
build-version:
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):$(VERSION) .

run:
	docker run --rm=true -it $(REPO)/$(NAME) ${CMD}

push:  export VERSION=$(shell docker run --rm=true -t $(REPO)/$(NAME) php -v | grep -m 1 PHP | sed 's/PHP \([^ -]*\).*/\1/')
push:
	docker push $(REPO)/$(NAME):latest
	docker push $(REPO)/$(NAME):$(VERSION)
