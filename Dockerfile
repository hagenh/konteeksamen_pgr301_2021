
FROM maven:3.6-jdk-11 as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn package

FROM adoptopenjdk/openjdk11:alpine
COPY --from=builder /app/target/*.jar /app/konte.jar
ENTRYPOINT ["java","-jar","/app/konte.jar"]



