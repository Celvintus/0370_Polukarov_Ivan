package main.java.catalog;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
@AllArgsConstructor
public class ProductRepository {

    @Getter
    private List<Product> products;

    public ProductRepository() {
        this(new ArrayList<>());
    }

    public List<Product> findAll() {
        return this.products;
    }

    public Optional<Product> findOneById(UUID id) {
        return this.products.stream()
                .filter(product -> Objects.equals(id, product.getId()))
                .findFirst();
    }
}
