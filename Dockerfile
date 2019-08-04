FROM maven:3.6-jdk-8

MAINTAINER Avinash Seelam

WORKDIR /maven-webapp-project

# Prepare by downloading dependencies
ADD pom.xml /maven-webapp-project/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
# This assumes you've configured such a goal in pom.xml
ADD src /simple_maven_avi/src
RUN ["mvn", "package"]

CMD ["java", "-war", "target/maven-webapp-project.war"]
