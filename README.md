# Simple goland web app

Purpose: 
- demonstrate Cartographer supply chains





```
docker run -p 8080:8080 simple-go-web-server
```

```
k create deployment simple-go-web-server --image localhost:5005/simple-go-web-server:latest --dry-run=client -oyaml > config/deployment.yaml
k create ns demo
```
