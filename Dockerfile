FROM python:3

LABEL maintainer="Leonardo Menezes"

# Update APT repositorys

RUN apt-get clean
RUN apt update

# AWS credentials bypass

ENV AWS_ACCESS_KEY_ID "FAKEACCESSKEYID"
ENV AWS_SECRET_ACCESS_KEY "FAKEACCESSKEY"

# Install java and set JAVA_HOME

RUN apt-get install -y default-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/

# Install aws cli

RUN pip install awscli
RUN aws --version

# Donwload and unzip dynamodb jar

RUN curl https://s3.sa-east-1.amazonaws.com/dynamodb-local-sao-paulo/dynamodb_local_latest.zip --output dynamo.zip
RUN apt-get install unzip
RUN unzip dynamo.zip -d .

EXPOSE 8000/tcp

CMD ["bash"]