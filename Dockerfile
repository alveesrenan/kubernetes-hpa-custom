FROM openjdk:8u212-jdk-slim

ARG JAR_FILE

COPY ${JAR_FILE} /app.jar

EXPOSE 80

ENTRYPOINT java -Xmx256m -Dspring.profiles.active=${PROFILE} -Djava.security.egd=file:/dev/./urandom -jar app.jar