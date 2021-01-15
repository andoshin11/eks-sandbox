NAME := echo-service
REVISION := $(shell git rev-parse --short HEAD)
TAG := $(REVISION)
ORGANIZATION := andoshin11
IMAGE_NAME	:= $(ORGANIZATION)/$(NAME):$(TAG)
LOCAL_PORT := 9999
PORT := 9999

.PHONY: build
build:
	go build main.go

.PHONY: build-image
build-image:
	docker build -t $(IMAGE_NAME) .

.PHONY: run-image
run-image:
	docker run -it -p $(LOCAL_PORT):$(PORT) $(IMAGE_NAME)

.PHONY: push-image
push-image:
	docker push $(IMAGE_NAME)
