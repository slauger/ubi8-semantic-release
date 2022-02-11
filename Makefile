.DEFAULT_GOAL := build

CONTAINER_NAME?=$(shell basename $(shell pwd))
CONTAINER_TAG?=latest

build:
	docker build -t $(CONTAINER_NAME):$(CONTAINER_TAG) .

test:
	docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(shell pwd):/src:ro gcr.io/gcp-runtimes/container-structure-test:latest test --image $(CONTAINER_NAME):$(CONTAINER_TAG) --config /src/tests/container-structure-test.yaml

push:
	docker push $(CONTAINER_NAME):$(CONTAINER_TAG)

run:
	docker run -it -v $(PWD):/workspace $(CONTAINER_NAME):$(CONTAINER_TAG) /bin/bash
