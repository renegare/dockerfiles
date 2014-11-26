REPO = renegare
NAME = $(shell basename `pwd`)

all: build tag push

build:
	docker pull $(REPO)/$(NAME)
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):latest .

tag: export TAG=$(shell docker run --rm=true -t $(REPO)/$(NAME) nginx -v 2>&1 | grep -m 1 nginx | sed 's/[^0-9\.]//g')
tag:
	docker tag $(REPO)/$(NAME):latest $(REPO)/$(NAME):$(TAG)

run:
	docker run --rm=true -it $(REPO)/$(NAME) ${CMD}

push:
	docker push $(REPO)/$(NAME)
