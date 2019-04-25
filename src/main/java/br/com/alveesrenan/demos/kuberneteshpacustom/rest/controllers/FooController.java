package br.com.alveesrenan.demos.kuberneteshpacustom.rest.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FooController {

    @GetMapping("/version")
    public String currentVersion() {
        return "Version 2 from project.";
    }
}
