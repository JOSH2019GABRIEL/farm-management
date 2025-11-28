FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY CGDMS-0.0.1.jar app.jar
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "app.jar"]