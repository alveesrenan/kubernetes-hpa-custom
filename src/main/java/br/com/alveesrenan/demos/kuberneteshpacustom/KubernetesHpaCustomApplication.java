package br.com.alveesrenan.demos.kuberneteshpacustom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties
public class KubernetesHpaCustomApplication {
	public static void main(String[] args) {
		SpringApplication.run(KubernetesHpaCustomApplication.class, args);
	}
}