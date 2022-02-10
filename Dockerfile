FROM openjdk:11-jdk
COPY ./target/foodbox-service-rest-0.0.1-SNAPSHOT.jar foodbox-service-rest-0.0.1-SNAPSHOT.jar
CMD ["java" ,"-jar","foodbox-service-rest-0.0.1-SNAPSHOT.jar"]
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers