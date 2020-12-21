package com.er.easyrent;
import com.er.easyrent.models.Productimages;
import com.er.easyrent.repos.ProductimagesRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/productimagesDB")
public class ProductimagesController {

    private final ProductimagesRepository productimagesRepository;

    public ProductimagesController(ProductimagesRepository productimagesRepository) {
        this.productimagesRepository = productimagesRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Productimages createProductimages(@RequestBody Productimages productimages) {
        return productimagesRepository.save(productimages);
    }

    @GetMapping
    public Iterable<Productimages> getProducts() {
        return productimagesRepository.findAll();
    }
}