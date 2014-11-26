REPO = renegare
NAME = $(shell basename `pwd`)

all: build tag push

build:
	docker pull $(REPO)/$(NAME)
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(NAME):latest .

tag: export TAG=$(shell docker run --rm=true -t $(REPO)/$(NAME) php -v | grep -m 1 PHP | sed 's/PHP \([^ -]*\).*/\1/')
tag:
	docker tag $(REPO)/$(NAME):latest $(REPO)/$(NAME):$(TAG)

run:
	docker run --rm=true -it $(REPO)/$(NAME) ${CMD}

push:
	docker push $(REPO)/$(NAME)
