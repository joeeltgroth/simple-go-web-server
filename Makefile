
IMG ?= simple-go-web-server:latest


.PHONY: docker-build
docker-build:
	pack build ${IMG} --buildpack paketo-buildpacks/go --builder paketobuildpacks/builder:base
