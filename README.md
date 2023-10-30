# Simple goland web app

Purpose: 
- demonstrate Cartographer supply chains





```
docker run -p 8080:8080 simple-go-web-server
```

### Creating the k8s deployment. 
```
k create deployment simple-go-web-server --image localhost:5005/simple-go-web-server:latest --dry-run=client -oyaml > config/deployment.yaml
k create ns demo
k -n demo expose deployment simple-go-web-server --port=8081 --target-port=8080
k -n demo get service simple-go-web-server -oyaml > config/service.yaml
```

### Deploying / undeploying
```
kapp deploy -n demo -a simple-go-web-server -f config -y
kapp delete -n demo -a simple-go-web-server -y
```

### Port-forward the service
```
k -n demo port-forward services/simple-go-web-server 8080:8081
```


### Install kapp-controller and the kctrl cli
```
kapp deploy -a kc -f https://github.com/carvel-dev/kapp-controller/releases/latest/download/release.yml

brew tap carvel-dev/carvel
brew install kctrl   # https://carvel.dev/kapp-controller/docs/develop/install/#installing-kapp-controller-cli-kctrl
```
