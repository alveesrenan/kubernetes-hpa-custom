package br.com.alveesrenan.demos.kuberneteshpacustom.etl.amqp.configs.props;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "amqp.queue")
public class ProcessorQueueProperties {
    private String name;
    private String exchange;
    private String routingKey;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getExchange() {
        return exchange;
    }

    public void setExchange(String exchange) {
        this.exchange = exchange;
    }

    public String getRoutingKey() {
        return routingKey;
    }

    public void setRoutingKey(String routingKey) {
        this.routingKey = routingKey;
    }
}
