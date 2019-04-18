FROM fabric8/java-jboss-openjdk8-jdk

<<<<<<< HEAD
ADD target/kubernetes-hpa-custom.jar /
=======
ARG JAR_FILE

ADD ${JAR_FILE} /kubernetes-hpa-custom.jar
>>>>>>> 52fa5114f3a01aab76b9fe5d9b5a979a544653c9

EXPOSE 8080

ENTRYPOINT java -XX:+PrintFlagsFinal -Xmx256m -Dspring.profiles.active=${PROFILE} -Djava.security.egd=file:/dev/./urandom -jar kubernetes-hpa-custom.jar