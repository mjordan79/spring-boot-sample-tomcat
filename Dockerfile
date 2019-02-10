# This build file requires variables that must be passed at build time:
# docker image build --build-arg JAR_NAME=spring-boot-tomcat --build-arg JAR_VERSION=0.0.1-SNAPSHOT -t repo/image:tag .
FROM openjdk:11-jre-slim

MAINTAINER Renato Perini <renato.perini@gmail.com>

ARG JAR_NAME
ARG JAR_VERSION
RUN echo "Building container for app: $JAR_NAME-$JAR_VERSION"
RUN apt-get update && apt-get upgrade -y

ADD target/${JAR_NAME}-${JAR_VERSION}.jar /opt/spring-boot-tomcat.jar
ADD target/docker-extra/run-java/run-java.sh /opt

WORKDIR /opt
RUN chmod +x run-java.sh

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "-c", "/opt/run-java.sh", "/opt/spring-boot-tomcat.jar"]