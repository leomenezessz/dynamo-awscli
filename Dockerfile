FROM python:3.7-alpine

LABEL maintainer="Leonardo Menezes"

# AWS credentials bypass

ENV AWS_ACCESS_KEY_ID "FAKEACCESSKEYID"
ENV AWS_SECRET_ACCESS_KEY "FAKEACCESSKEY"

# Install java

RUN  apk update && apk add --no-cache openjdk8 curl bash

# Install aws cli

RUN pip install awscli

# Donwload and unzip dynamodb jar

RUN curl https://s3.sa-east-1.amazonaws.com/dynamodb-local-sao-paulo/dynamodb_local_latest.zip --output dynamo.zip
RUN apk add unzip
RUN unzip dynamo.zip -d .

EXPOSE 8000/tcp

CMD ["bash"]