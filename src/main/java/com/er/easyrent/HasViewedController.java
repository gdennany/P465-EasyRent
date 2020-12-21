package com.er.easyrent;
import com.er.easyrent.models.HasViewed;
import com.er.easyrent.repos.HasViewedRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/hasViewed")
public class HasViewedController {

    private final HasViewedRepository hasViewedRepository;

    public HasViewedController(HasViewedRepository hasViewedRepository) {
        this.hasViewedRepository = hasViewedRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public HasViewed createHasViewed(@RequestBody HasViewed hasViewed) {
        return hasViewedRepository.save(hasViewed);
    }

    @GetMapping
    public Iterable<HasViewed> getHasVieweds() {
        return hasViewedRepository.findAll();
    }
}