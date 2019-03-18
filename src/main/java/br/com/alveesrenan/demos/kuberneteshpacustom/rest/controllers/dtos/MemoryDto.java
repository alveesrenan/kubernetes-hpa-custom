package br.com.alveesrenan.demos.kuberneteshpacustom.rest.controllers.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
public class MemoryDto {
    private String message;
}
