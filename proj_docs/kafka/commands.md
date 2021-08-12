minikube start --memory=4096 --cpus=2 --kubernetes-version=v1.18.6 --vm-driver=virtualbox -p kafka

minikube docker-env -p kafka

kubectl apply -f strimzi.txt -n default

kubectl apply -f kafka.yaml -n default

kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n default