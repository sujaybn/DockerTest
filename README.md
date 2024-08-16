# Kafka Producer and Consumer Java Application

This is a simple Java application that demonstrates the usage of Apache Kafka with both a producer and a consumer. The application is packaged using Maven and Dockerized for easy deployment.

## Prerequisites

Before you start, make sure you have the following installed:

- Java 11 or higher
- Apache Kafka running on your machine or server
- Docker
- Maven

## Project Structure

```
.
├── src
│   └── main
│       └── java
│           └── org
│               └── example
│                   ├── KafkaApp.java      # Main class
│                   ├── ProducerMain.java  # Kafka producer logic
│                   └── ConsumerMain.java  # Kafka consumer logic
├── Dockerfile        # Docker setup
├── pom.xml           # Maven dependencies and build configuration
└── README.md         # Project documentation
```

### Main Components

1. **`KafkaApp.java`**: This is the entry point for the application. It launches both the Kafka producer and consumer on separate threads.
2. **`ProducerMain.java`**: This class contains logic for sending messages to the Kafka topic.
3. **`ConsumerMain.java`**: This class contains logic for consuming messages from the Kafka topic.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/sujaybn/DockerTest.git
cd DockerTest
```

### 2. Kafka Setup

Make sure you have Kafka running locally. You can download and start Kafka by following the [official documentation](https://kafka.apache.org/quickstart).

### Start ZooKeeper using the default configuration:

```bash
bin/zookeeper-server-start.sh config/zookeeper.properties
```

### Start Kafka Broker
Once ZooKeeper is running, start the Kafka broker: Open a new terminal (leaving the ZooKeeper terminal running) and start the Kafka server:

```bash
bin/kafka-server-start.sh config/server.properties
```

### 3. Build the Project

The project uses Maven as the build tool. Ensure that all dependencies, including the Kafka client, are included.

```bash
mvn clean package
```

This will package your application and create a fat JAR in the `target/` directory, containing all necessary dependencies.

### 4. Docker Setup

To containerize the application, we use a multi-stage Dockerfile to build and run the Java application.

#### Dockerfile Overview

- **Builder stage**: Uses a Maven image to compile and package the Java application into a fat JAR.
- **Runtime stage**: Uses a lightweight OpenJDK 11 JRE image to run the application.

### 5. Build the Docker Image

To build the Docker image, run:

```bash
docker build -t DockerTest .
```

### 6. Running the Application in Docker

To run the application using Docker, execute the following command:

```bash
docker run --network="host" DockerTest
```

The `--network="host"` option is required so that the Docker container can communicate with the Kafka broker running on the host.

### 7. Kafka Producer and Consumer

- **Producer**: Sends messages to the Kafka topic.
- **Consumer**: Reads messages from the Kafka topic.

Both producer and consumer are running in separate threads managed by the `KafkaApp` main class.

## Troubleshooting

### `NoClassDefFoundError`
If you encounter `NoClassDefFoundError` for Kafka client classes such as `StringSerializer` or `StringDeserializer`, make sure that:

- All Kafka dependencies are included in the `pom.xml`.
- You're using the Maven Shade Plugin to create a fat JAR containing all dependencies.
- The Dockerfile is correctly pointing to the built JAR file.

### Networking Issues
Ensure that Kafka is running on your host machine and that you are using the `--network="host"` option when running the Docker container.

## Conclusion

This project demonstrates how to implement a simple Kafka producer and consumer in Java, package it using Maven, and deploy it using Docker. You can now easily run this Kafka application in any environment where Docker is available.
