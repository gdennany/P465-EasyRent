package com.er.easyrent;
import com.er.easyrent.models.HasFavorite;
import com.er.easyrent.repos.HasFavoriteRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/hasFavorite")
public class HasFavoriteController {

    private final HasFavoriteRepository hasFavoriteRepository;

    public HasFavoriteController(HasFavoriteRepository hasFavoriteRepository) {
        this.hasFavoriteRepository = hasFavoriteRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public HasFavorite createHasFavorite(@RequestBody HasFavorite hasFavorite) {
        return hasFavoriteRepository.save(hasFavorite);
    }

    @GetMapping
    public Iterable<HasFavorite> getHasFavorites() {
        return hasFavoriteRepository.findAll();
    }
}