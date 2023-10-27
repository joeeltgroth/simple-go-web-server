
REGISTRY ?= localhost:5005
IMG ?= simple-go-web-server:latest


.PHONY: build-image
build-image:
	pack build ${IMG} --buildpack paketo-buildpacks/go --builder paketobuildpacks/builder:base && \
	docker tag ${IMG} ${REGISTRY}/${IMG} && \
    docker push  ${REGISTRY}/${IMG}
