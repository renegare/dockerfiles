REPO = renegare
NAME = $(shell basename `pwd`)

all: build build-version push

build:
	docker pull $(REPO)/$(NAME)
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):latest .

build-version: export VERSION=$(shell docker run --rm=true -t $(REPO)/$(NAME) nginx -v 2>&1 | grep -m 1 nginx | sed 's/[^0-9\.]//g')
build-version:
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):$(VERSION) .

run:
	docker run --rm=true -it $(REPO)/$(NAME) ${CMD}

push: export VERSION=$(shell docker run --rm=true -t $(REPO)/$(NAME) nginx -v 2>&1 | grep -m 1 nginx | sed 's/[^0-9\.]//g')
push:
	docker push $(REPO)/$(NAME):latest
	docker push $(REPO)/$(NAME):$(VERSION)
