FROM openjdk:8-jre-alpine

ARG JAR_FILE

COPY ${JAR_FILE} /app.jar

EXPOSE 80

ENTRYPOINT java -XX:+PrintFlagsFinal -Xmx256m -Dspring.profiles.active=${PROFILE} -Djava.security.egd=file:/dev/./urandom -jar app.jar