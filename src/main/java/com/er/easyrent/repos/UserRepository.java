package com.er.easyrent.repos;
import com.er.easyrent.models.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
}
