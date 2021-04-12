minikube start —vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f configmap.yaml
eval $(minikube docker-env)
docker build -t nginx_image .
kubectl apply -f nginx.yaml

# minikube dashboard
# kubectl delete svc nginx-svc
# kubectl delete deploy nginx-deployment
# kubectl get svc 