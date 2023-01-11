FROM openjdk:8
EXPOSE 8080
ADD target/java-app1.jar java-app1.jar
ENTRYPOINT ["java" , "-jar", "/java-app1.jar"]