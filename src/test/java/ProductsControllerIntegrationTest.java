/*
 * Copyright 2019 Alexander Kosarev
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package test.java;

import main.java.catalog.Product;
import main.java.catalog.ProductRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ProductsControllerIntegrationTest {

    @Autowired
    MockMvc mockMvc;

    @SpyBean
    ProductRepository productRepository;

    @Before
    public void setUp() {
        this.productRepository.getProducts().clear();
        List<Product> products = IntStream.range(1, 4)
                .mapToObj(i -> new Product(UUID.randomUUID(), "Product #" + i,
                        "Product #" + i + " description"))
                .collect(Collectors.toList());

        this.productRepository.getProducts().addAll(products);
    }

    @Test
    public void list_ReturnsProductsListPage() throws Exception {
        // when
        this.mockMvc.perform(MockMvcRequestBuilders.get("/catalog/products/list"))
                // then
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.model().attribute("products",
                        this.productRepository.getProducts()))
                .andExpect(MockMvcResultMatchers.view().name("catalog/products/list"))
                .andExpect(MockMvcResultMatchers.xpath("//li[@class='product']").nodeCount(3));

        Mockito.verify(this.productRepository).findAll();
    }

    @Test
    public void product_ProductExists_ReturnsProductPage() throws Exception {
        // given
        UUID id = this.productRepository.getProducts().get(1).getId();

        // when
        this.mockMvc.perform(MockMvcRequestBuilders.get("/catalog/products/{productId}", id))
                // then
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.model().attribute("product",
                        this.productRepository.getProducts().get(1)))
                .andExpect(MockMvcResultMatchers.view().name("catalog/products/product"))
                .andExpect(MockMvcResultMatchers.xpath("//meta[@name='product-id']/@content")
                        .string(id.toString()));

        Mockito.verify(this.productRepository).findOneById(ArgumentMatchers.eq(id));
    }

    @Test
    public void product_ProductDoesNotExist_ReturnsErrorPage() throws Exception {
        // given
        UUID id = UUID.randomUUID();

        // when
        this.mockMvc.perform(MockMvcRequestBuilders.get("/catalog/products/{productId}", id))
                // then
                .andExpect(MockMvcResultMatchers.status().isNotFound())
                .andExpect(MockMvcResultMatchers.model().attribute("error", "Couldn't find a product"))
                .andExpect(MockMvcResultMatchers.view().name("errors/404"))
                .andExpect(MockMvcResultMatchers.xpath("//div[@class='error']")
                        .string("Couldn't find a product"));

        Mockito.verify(this.productRepository).findOneById(ArgumentMatchers.eq(id));
    }
}
