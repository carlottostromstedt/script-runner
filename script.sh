#!/bin/bash

fullImageName=$1
imageName=$2
port=$3

log_file="deployment_log.txt"

echo "$(date +"%Y-%m-%d %H:%M:%S") - Starting deployment script" >> "$log_file"

echo "$(date +"%Y-%m-%d %H:%M:%S") - Creating deployment for $imageName image" >> "$log_file"
kubectl create deployment $imageName --image=$fullImageName

echo "$(date +"%Y-%m-%d %H:%M:%S") - Exposing deployment as NodePort service on port $port" >> "$log_file"
kubectl expose deployment $imageName --type=NodePort --port $port

echo "$(date +"%Y-%m-%d %H:%M:%S") - Deployment script completed" >> "$log_file"
