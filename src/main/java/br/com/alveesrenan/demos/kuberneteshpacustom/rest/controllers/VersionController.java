package br.com.alveesrenan.demos.kuberneteshpacustom.rest.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class VersionController {

    @GetMapping("/version")
    public String currentVersion() {
        return "Version 1 from project.";
    }
}
