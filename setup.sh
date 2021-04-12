minikube start —vm-driver=virtualbox
minikube addons enable metallb
kubectl apply -f srcs/configmap.yaml
eval $(minikube docker-env)

#mysql
docker build srcs/mysql --tag mysql_image
kubectl apply -f srcs/mysql/mysql.yaml

#nginx
docker build srcs/nginx --tag nginx_image
kubectl apply -f srcs/nginx/nginx.yaml

#wordpress
docker build srcs/wordpress --tag wordpress_image
kubectl apply -f srcs/wordpress/wp.yaml

#phpmyadmin
docker build srcs/phpmyadmin --tag phpmyadmin_image
kubectl apply -f srcs/phpmyadmin/phpma.yaml

# #ftps
# docker build srcs/ftps --tag ftps_image
# kubectl apply -f srcs/ftps/ftps.yaml


# minikube dashboard
# kubectl delete svc nginx-svc
# kubectl delete deploy nginx-deployment
# kubectl get svc 
# kubectl get deploy 