REPO = renegare
NAME = $(shell basename `pwd`)

all: build build-version push

build:
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):latest .

build-version: build
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):$(shell docker run --rm=true -t $(REPO)/$(NAME) echo `nginx -v 2>&1 | sed 's/[^0-9\.]//g'`) .

push:
	docker push $(REPO)/$(NAME):latest
	docker push $(REPO)/$(NAME):$(shell docker run --rm=true -t $(REPO)/$(NAME) echo `nginx -v 2>&1 | sed 's/[^0-9\.]//g'`)
