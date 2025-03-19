FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y unzip vim telnet openjdk-11-jdk curl

# Download and extract Apache Tomcat
RUN curl -L -o apache-tomcat-8.5.91.tar.gz https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.91/bin/apache-tomcat-8.5.91.tar.gz && \
    tar -xvzf apache-tomcat-8.5.91.tar.gz && \
    mv apache-tomcat-8.5.91 /usr/local/tomcat

# Ensure correct permissions for Tomcat execution
RUN chmod +x /usr/local/tomcat/bin/*.sh

# Copy the WAR file into Tomcat webapps directory
COPY target/dptweb-1.0.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

