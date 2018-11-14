FROM openjdk:8-jre

MAINTAINER Renato Perini <renato.perini@gmail.com>

RUN mkdir /opt/spring-boot-tomcat
ARG JAR_FILE
ADD target/${JAR_FILE} /opt/spring-boot-tomcat/spring-boot-tomcat.jar

ENTRYPOINT ["/usr/bin/java", "-jar", "/opt/spring-boot-tomcat/spring-boot-tomcat.jar"]
EXPOSE 8080