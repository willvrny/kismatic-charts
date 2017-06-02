#!/bin/bash

# build all charts without dependencies first
echo "Package charts"
cd "$1"
# package up all the charts without dependecies
for dir in */
do
  if [ ! -f $dir/requirements.yaml ]; then
    helm package $dir -d $2
  fi
done

# start local repo
echo "Starting helm server on 127.0.0.1:8879"
helm serve --repo-path $2 &

echo "Waiting helm to launch on 8879..."
while ! nc -z localhost 8879; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done
echo "Helm server running on 127.0.0.1:8879"

helm repo add local http://127.0.0.1:8879
helm repo update

# get dependency charts and package them
echo "Download chart dependencies"
for dir in */
do
  if [ -f $dir/requirements.yaml ]; then
    ( cd $dir && helm dep up )
    helm package $dir -d $2
  fi
done