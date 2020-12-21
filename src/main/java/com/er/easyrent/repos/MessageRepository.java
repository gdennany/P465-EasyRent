package com.er.easyrent.repos;
import com.er.easyrent.models.Message;

import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Long> {
}
