package com.er.easyrent;
import com.er.easyrent.models.User;
import com.er.easyrent.repos.UserRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/userDB")
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public User createLogin(@RequestBody User user) {
        return userRepository.save(user);
    }

    @GetMapping
    public Iterable<User> getLogins() {
        return userRepository.findAll();
    }
}