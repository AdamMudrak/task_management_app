# Build stage
FROM maven:3.9.9-eclipse-temurin-21-alpine AS build
WORKDIR /workspace
COPY pom.xml ./
COPY src ./src
RUN mvn -DskipTests -Dcheckstyle.skip package

# Extract stage
FROM eclipse-temurin:21-jdk-alpine AS extractor
WORKDIR /application
COPY --from=build /workspace/target/*.jar application.jar
RUN java -Djarmode=layertools -jar application.jar extract

# Final stage
FROM eclipse-temurin:21-jre-alpine
WORKDIR /application

COPY --from=extractor /application/dependencies/ ./
COPY --from=extractor /application/spring-boot-loader/ ./
COPY --from=extractor /application/snapshot-dependencies/ ./
COPY --from=extractor /application/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.launch.JarLauncher"]
EXPOSE 8082
