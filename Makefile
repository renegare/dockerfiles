REPO=renegare/$(IMAGE)
CMD=/bin/bash

all: build tag push

pull: export STATUS_CODE=$(shell curl -w %{http_code} -s --output /dev/null https://registry.hub.docker.com/u/$(REPO)/)
pull:
	@if [ 200 -eq $(STATUS_CODE) ]; then docker pull $(REPO); fi
	
build:
	@docker build --force-rm=true --rm=true -t $(REPO):latest ./$(IMAGE)

tag: export TAG=$(shell docker run --rm=true -t $(REPO))
tag:
	docker tag $(REPO):latest $(REPO):$(TAG)

run:
	@docker run --rm=true -it $(REPO) $(CMD)

push:
	@docker push $(REPO)
