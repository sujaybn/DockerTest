package org.kafka.pubsub;

public class KafkaApp {
    public static void main(String[] args) {
        // Start Producer in a separate thread
        Thread producerThread = new Thread(() -> {
            ProducerMain.main(args);
        });

        // Start Consumer in a separate thread
        Thread consumerThread = new Thread(() -> {
            ConsumerMain.main(args);
        });

        producerThread.start();
        consumerThread.start();

        try {
            producerThread.join();
            consumerThread.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
