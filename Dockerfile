
#Ubuntu as the base image
FROM ubuntu:latest

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

RUN apt-get install -y apache2
RUN apt-get install -y wget
#Tomcat9 installation

RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz && \
    tar xzf apache-tomcat-9.0.55.tar.gz && \
    mv apache-tomcat-9.0.55 /var/lib/tomcat9
COPY webapp.war /var/lib/tomcat9/webapps
EXPOSE 80 8080
CMD service apache2 start && /var/lib/tomcat9/bin/catalina.sh run
