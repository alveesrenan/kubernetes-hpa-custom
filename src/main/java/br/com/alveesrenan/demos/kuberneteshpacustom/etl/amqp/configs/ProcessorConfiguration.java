package br.com.alveesrenan.demos.kuberneteshpacustom.etl.amqp.configs;

import br.com.alveesrenan.demos.kuberneteshpacustom.etl.amqp.configs.props.ProcessorQueueProperties;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

@Configuration
public class ProcessorConfiguration {

    private ProcessorQueueProperties props;

    @Autowired
    public ProcessorConfiguration(ProcessorQueueProperties props) {
        this.props = props;
    }

    @Bean
    public TopicExchange exchange() {
        return new TopicExchange(props.getExchange());
    }

    @Bean
    public Queue queue() {
        return new Queue(props.getName(), true, false, false, new ConcurrentHashMap<>());
    }

    @Bean
    public Binding bindingExchangeToQueueByRoutingKey() {
        return BindingBuilder.bind(queue())
                .to(exchange())
                .with(props.getRoutingKey());
    }
}
