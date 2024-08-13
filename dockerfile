# Use Maven image to build the application
FROM maven:3.8.6-openjdk-11 AS builder

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the project (including JAR packaging)
RUN mvn clean package

# Use a smaller base image for runtime
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/DockerTest-1.0-SNAPSHOT.jar /app/DockerTest-1.0-SNAPSHOT.jar

# Specify the command to run the JAR file
CMD ["java", "-jar", "/app/DockerTest-1.0-SNAPSHOT.jar"]

# CMD ["java", "-jar", "/app/DockerTest-1.0-SNAPSHOT.jar"]