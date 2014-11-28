REPO=renegare
CMD=/bin/bash

all: build tag push

build:
	docker build --force-rm=true -q --rm=true -t $(REPO)/$(IMAGE):latest ./$(IMAGE)

tag: export TAG=$(shell docker run --rm=true -t $(REPO)/$(IMAGE))
tag:
	docker tag $(REPO)/$(IMAGE):latest $(REPO)/$(IMAGE):$(TAG)

run:
	docker run --rm=true -it $(REPO)/$(IMAGE) $(CMD)

push:
	docker push $(REPO)/$(IMAGE)
