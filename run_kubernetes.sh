#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# verify, that the kube is started
# minikube start
# kubectl config view
# here is commands https://kubernetes.io/ru/docs/reference/kubectl/cheatsheet/

# Step 1:
# This is your Docker ID/path
dockerpath="slavalion/priceprediction"
imagename="priceprediction"

# Step 2
# Run the Docker Hub container with kubernetes
docker login
kubectl run $imagename\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=$imagename


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $imagename 8000:80
kubectl logs $imagename