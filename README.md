# (POC) Serverless deploy using terraform

## how to deploy?

1. ensure you have localstack running locally in the 4566 port.
2. execute

```bash
chmod +x build.sh
./build.sh
```

## how to test?

```
aws --endpoint-url=localstack:4566 lambda list-functions
aws --endpoint-url=localstack:4566 lambda invoke --function-name lambda_function_name out.txt && cat out.txt
```
