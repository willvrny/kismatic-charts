#!/bin/bash

cd "$1"
for dir in */
do
  helm package $dir -d $2
done