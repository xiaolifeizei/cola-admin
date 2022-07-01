FROM openjdk:8u292-jdk-slim

MAINTAINER xiaolifeizei@163.com

RUN mkdir -p /cola-service-basics
WORKDIR /cola-service-basics

EXPOSE 8081
EXPOSE 20881

ADD ./target/*.jar ./app.jar
ENV PARAMS=""

ENTRYPOINT ["sh","-c","java -Djava.security.egd=file:/dev/./urandom $PARAMS -jar  app.jar"]

