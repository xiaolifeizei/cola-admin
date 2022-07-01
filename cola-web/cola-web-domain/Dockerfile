FROM openjdk:8u292-jdk-slim

MAINTAINER xiaolifeizei@163.com

RUN mkdir -p /cola-web-domain
WORKDIR /cola-web-domain

EXPOSE 8085
EXPOSE 20889

ADD ./target/*.jar ./app.jar
ENV PARAMS=""

ENTRYPOINT ["sh","-c","java -Djava.security.egd=file:/dev/./urandom $PARAMS -jar  app.jar"]

