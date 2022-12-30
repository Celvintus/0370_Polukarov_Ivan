package test.java;

import main.java.catalog.Product;
import main.java.catalog.ProductRepository;
import org.junit.Assert;
import org.junit.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class ProductsControllerTest {

    private ProductRepository productRepository  = Mockito.mock(ProductRepository.class);

    private ProductsController productsController = new ProductsController(productRepository);

    @Test
    public void list_ReturnsValidModelAndView() {
        // given
        List<Product> products = IntStream.range(1, 4)
                .mapToObj(i -> new Product(UUID.randomUUID(), "Product #" + i,
                        "Product #" + i + " description"))
                .collect(Collectors.toList());

        Mockito.doReturn(products).when(this.productRepository).findAll();

        // when
        ModelAndView modelAndView = this.productsController.list();

        // then
        Assert.assertNotNull(modelAndView);
        Assert.assertEquals(products, modelAndView.getModel().get("products"));
        Assert.assertEquals("catalog/products/list", modelAndView.getViewName());
        Assert.assertEquals(HttpStatus.OK, modelAndView.getStatus());

        Mockito.verify(this.productRepository).findAll();
    }

    @Test
    public void product_ProductExists_ReturnsValidModelAndView() {
        // given
        Product product = new Product(UUID.randomUUID(), "Product #1", "Product #1 description");
        Mockito.doReturn(Optional.of(product)).when(this.productRepository).findOneById(ArgumentMatchers.any());

        // when
        ModelAndView modelAndView = this.productsController.product(product.getId());

        // then
        Assert.assertNotNull(modelAndView);
        Assert.assertEquals(product, modelAndView.getModel().get("product"));
        Assert.assertEquals("catalog/products/product", modelAndView.getViewName());
        Assert.assertEquals(HttpStatus.OK, modelAndView.getStatus());

        Mockito.verify(this.productRepository).findOneById(ArgumentMatchers.eq(product.getId()));
    }

    @Test
    public void product_ProductDoesNotExist_ReturnsModelAndViewWithError() {
        UUID productId = UUID.randomUUID();
        Mockito.doReturn(Optional.empty()).when(this.productRepository).findOneById(ArgumentMatchers.any());

        ModelAndView modelAndView = this.productsController.product(productId);

        Assert.assertNotNull(modelAndView);
        Assert.assertEquals("Couldn't find a product", modelAndView.getModel().get("error"));
        Assert.assertEquals("error", modelAndView.getViewName());
        Assert.assertEquals(HttpStatus.NOT_FOUND, modelAndView.getStatus());

        Mockito.verify(this.productRepository).findOneById(ArgumentMatchers.eq(productId));
    }
}
