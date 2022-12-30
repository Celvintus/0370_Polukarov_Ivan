package main.java;

import main.java.catalog.Product;
import main.java.catalog.ProductRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(ProductRepository productRepository) {
        return args -> {
            List<Product> products = IntStream.range(1, 4)
                    .mapToObj(i -> new Product(UUID.randomUUID(), "Product #" + i,
                            "Product #" + i + " description"))
                    .collect(Collectors.toList());
            productRepository.getProducts().addAll(products);
        };
    }
}
