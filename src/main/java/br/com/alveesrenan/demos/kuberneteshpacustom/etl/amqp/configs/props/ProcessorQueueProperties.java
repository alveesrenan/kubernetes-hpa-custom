package br.com.alveesrenan.demos.kuberneteshpacustom.etl.amqp.configs.props;

import lombok.Data;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "amqp.queue")
public class ProcessorQueueProperties {
    private String name;
    private String exchange;
    private String routingKey;
}
