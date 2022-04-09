#!/bin/bash

kubectl delete --all deployments
kubectl delete --all pv
kubectl delete --all pvc
kubectl delete --all hpa
kubectl delete -f scale_deployments.yml
kubectl delete -f hpa_components.yaml
kubectl delete service clusterip-authentication
kubectl delete service clusterip-file-system
kubectl delete service clusterip-mysql
kubectl delete service lb-upload-video
kubectl delete service lb-video-streaming

docker build -t jperlas/upload_video:latest ./upload_video
docker build -t jperlas/mysql:latest ./mysql_db
docker build -t jperlas/authentication:latest ./authentication
docker build -t jperlas/video_streaming:latest ./video_streaming
docker build -t jperlas/file_system:latest ./file_system

docker tag jperlas/upload_video:latest gcr.io/acit3495ass2/upload_video
docker tag jperlas/mysql:latest gcr.io/acit3495ass2/mysql
docker tag jperlas/authentication:latest gcr.io/acit3495ass2/authentication
docker tag jperlas/video_streaming:latest gcr.io/acit3495ass2/video_streaming
docker tag jperlas/file_system:latest gcr.io/acit3495ass2/file_system

docker push gcr.io/acit3495ass2/upload_video
docker push gcr.io/acit3495ass2/mysql
docker push gcr.io/acit3495ass2/authentication
docker push gcr.io/acit3495ass2/video_streaming
docker push gcr.io/acit3495ass2/file_system

# kubectl apply -f pv_nfs_server.yml
# kubectl apply -f pvc_nfs_server.yml
kubectl apply -f deploy_nfs_server.yml
kubectl apply -f svc_nfs_server.yml
kubectl apply -f pv_nfs.yml
kubectl apply -f pvc_nfs.yml
# kubectl apply -f pv_nfs_mysql.yml
# kubectl apply -f pvc_nfs_server_mysql.yml
# kubectl apply -f pvc_nfs_mysql.yml

kubectl apply -f svc_mysql.yml
kubectl apply -f svc_upload_video.yml
kubectl apply -f svc_authentication.yml
kubectl apply -f svc_video_streaming.yml
kubectl apply -f svc_file_system.yml

kubectl apply -f deploy_mysql.yml
kubectl apply -f deploy_upload_video.yml
kubectl apply -f deploy_authentication.yml
kubectl apply -f deploy_video_streaming.yml
kubectl apply -f deploy_file_system.yml

kubectl apply -f scale_deployments.yml

# kubectl apply -f hpa_components.yaml


