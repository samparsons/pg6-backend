# code below is from medium tutorial by Wynn Teo, https://medium.com/geekculture/dockerizing-a-spring-boot-application-with-maven-122286e9f582
# it has been modified slightly for my use case.


# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS maven



WORKDIR /usr/src/app
COPY . /usr/src/app
# Compile and package the application to an executable JAR
RUN mvn package 

# For Java 11, 
FROM adoptopenjdk/openjdk11:alpine-jre
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EXPOSE 8081
EXPOSE 3306

ARG JAR_FILE=foodbox-service-rest-0.0.1-SNAPSHOT.jar

WORKDIR /opt/app

# Copy the foodbox-service-rest-0.0.1-SNAPSHOT.jar from the maven stage to the /opt/app directory of the current stage.
COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java","-jar","foodbox-service-rest-0.0.1-SNAPSHOT.jar"]

# old code that didn't seem to work.
#FROM openjdk:11-jdk
#COPY ./target/foodbox-service-rest-0.0.1-SNAPSHOT.jar foodbox-service-rest-0.0.1-SNAPSHOT.jar
#CMD ["java" ,"-jar","foodbox-service-rest-0.0.1-SNAPSHOT.jar"]
#RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers