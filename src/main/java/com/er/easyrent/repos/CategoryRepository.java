package com.er.easyrent.repos;

import com.er.easyrent.models.Category;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long> {
}