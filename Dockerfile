FROM openjdk:11-jdk-alpine
FROM mysql:8.0.26-alpine
COPY ./target/foodbox-service-rest-0.0.1-SNAPSHOT.jar foodbox-service-rest-0.0.1-SNAPSHOT.jar
CMD ["java" ,"-jar","foodbox-service-rest-0.0.1-SNAPSHOT.jar"]
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EXPOSE 8081/tcp
EXPOSE 3306/tcp