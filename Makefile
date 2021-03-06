TARGET=eagle
TAG=v1
IMAGE_PREFIX=edmundduntis
TARGET_IMAGE_DEV=$(IMAGE_PREFIX)/$(TARGET):$(TAG)

image-dev:
	docker build -t $(TARGET_IMAGE_DEV) .
build-dev-nch:
	docker build -t $(TARGET_IMAGE_DEV) --no-cache .
push-dev:
	docker push $(TARGET_IMAGE_DEV)

ci-dev: image-dev push-dev
ci-dev-nch: build-dev-nch push-dev
clean:
	rm -rf dist

.PHONY: image target clean $(TARGET)