package com.er.easyrent;
import com.er.easyrent.models.Role;
import com.er.easyrent.repos.RoleRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/roleDB")
public class RoleTableController {

    private final RoleRepository roleRepository;

    public RoleTableController(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Role createRole(@RequestBody Role role) {
        return roleRepository.save(role);
    }

    @GetMapping
    public Iterable<Role> getRoles() {
        return roleRepository.findAll();
    }
}