package main.java.com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MessageController {

    @Value("${app.displayMessage:Default Message}")
    private String displayMessage;

    @GetMapping("/message")
    public String getMessage() {
        return displayMessage;
    }
}