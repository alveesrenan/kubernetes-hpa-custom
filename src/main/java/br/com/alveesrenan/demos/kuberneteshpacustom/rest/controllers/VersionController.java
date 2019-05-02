package br.com.alveesrenan.demos.kuberneteshpacustom.rest.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VersionController {

    @GetMapping("/version")
    public String currentVersion() {
        return "Version 7 from project.";
    }
}
