package com.er.easyrent;
import com.er.easyrent.models.Category;
import com.er.easyrent.repos.CategoryRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/categoryDB")
public class CategoryController {

    private final CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Category createCategory(@RequestBody Category category) {
        return categoryRepository.save(category);
    }
    @GetMapping
    public Iterable<Category> getCategorys() {
        return categoryRepository.findAll();
    }
}