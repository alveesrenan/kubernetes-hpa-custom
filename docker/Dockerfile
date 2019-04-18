FROM fabric8/java-jboss-openjdk8-jdk

ARG JAR_FILE

ADD ${JAR_FILE} /kubernetes-hpa-custom.jar

EXPOSE 8080

ENTRYPOINT java -XX:+PrintFlagsFinal -Xmx256m -Dspring.profiles.active=${PROFILE} -Djava.security.egd=file:/dev/./urandom -jar kubernetes-hpa-custom.jar