package br.com.alveesrenan.demos.kuberneteshpacustom.rest.controllers;

import br.com.alveesrenan.demos.kuberneteshpacustom.services.MemoryAllocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class MemoryAllocationRestController {

    @Autowired
    private MemoryAllocationService memoryAllocationService;

    @GetMapping(value = "/memory", produces = MediaType.APPLICATION_JSON_VALUE)
    public String allocMemory() {
        return memoryAllocationService.allocMemory();
    }
}
