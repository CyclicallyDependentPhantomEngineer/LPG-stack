#!/bin/bash

helm repo add longhorn https://charts.longhorn.io
helm repo update

kubectl create namespace longhorn-system
helm install longhorn longhorn/longhorn --namespace longhorn-system

sleep 1000

kubectl port-forward -n longhorn-system svc/longhorn-frontend 8080:80
