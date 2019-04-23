FROM openjdk:8-jre-alpine

ADD target/kubernetes-hpa-custom.jar /app.jar

EXPOSE 8080

ENTRYPOINT java -XX:+PrintFlagsFinal -Xmx256m -Dspring.profiles.active=${PROFILE} -Djava.security.egd=file:/dev/./urandom -jar app.jar