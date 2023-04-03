# Build stage
FROM maven:3.6.3-openjdk-8 AS build
COPY . /app
WORKDIR /app
RUN mvn package

# Deployment stage
FROM openjdk:8-alpine
COPY --from=build /app/target/springboot-images-new.jar springboot-images-new.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/springboot-images-new.jar"]
