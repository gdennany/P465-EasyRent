package com.er.easyrent;
import com.er.easyrent.models.Message;
import com.er.easyrent.repos.MessageRepository;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

// for testing connection to database
@RestController
@RequestMapping("/messageDB")
public class MessageDBController {

    private final MessageRepository messageRepository;

    public MessageDBController(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Message createMessage(@RequestBody Message message) {
        return messageRepository.save(message);
    }

    @GetMapping
    public Iterable<Message> getMessages() {
        return messageRepository.findAll();
    }
}
