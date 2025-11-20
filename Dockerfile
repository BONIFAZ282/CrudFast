# Etapa 1: Construcción del JAR
FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml ./
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn clean package -DskipTests

RUN ls -la /app/target

# Etapa 2: Imagen final
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# OJO: nombre correcto del jar
COPY --from=build /app/target/CrudFast-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
