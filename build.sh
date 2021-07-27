#!/usr/bin/env sh  

cd api
rm -rf api/.serverless build
sls package
mkdir build
cp .serverless/*.zip ./build/
cd ..


cd iac

terraform validate
terraform apply --auto-approve
