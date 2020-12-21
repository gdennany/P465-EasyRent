package com.er.easyrent;
import com.er.easyrent.models.Security;
import com.er.easyrent.repos.SecurityRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/SecurityDB")
public class SecurityController {

    private final SecurityRepository securityRepository;

    public SecurityController(SecurityRepository securityRepository) {
        this.securityRepository = securityRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Security createSecurity(@RequestBody Security security) {
        return securityRepository.save(security);
    }

    @GetMapping
    public Iterable<Security> getSecurities() {
        return securityRepository.findAll();
    }
}