
REGISTRY ?= localhost:5005
IMG ?= simple-go-web-server:latest

.PHONY: create-kind-cluster
create-kind-cluster:
	ctlptl create registry kind --port=5005 && \
	ctlptl create cluster kind --registry=kind

.PHONY: destroy-kind-cluster
destroy-kind-cluster:
	ctlptl delete registry kind & \
	ctlptl delete cluster kind


.PHONY: build-image
build-image:
	pack build ${IMG} --buildpack paketo-buildpacks/go --builder paketobuildpacks/builder:base && \
	docker tag ${IMG} ${REGISTRY}/${IMG} && \
    docker push  ${REGISTRY}/${IMG}


.PHONY: kapp-deploy-to-cluster
kapp-deploy-to-cluster:
	kapp deploy -n demo -a simple-go-web-server -f config -y

.PHONY: kapp-delete-from-cluster
kapp-delete-from-cluster:
	kapp delete -n demo -a simple-go-web-server -y
