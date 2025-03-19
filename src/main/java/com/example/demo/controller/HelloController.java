package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HelloController {

    @Value("${custom.message}")
    private String message;
    

    @GetMapping("/info")
    public String getInfo() {
        return "Active Profile running here: " + message;
    }
}

