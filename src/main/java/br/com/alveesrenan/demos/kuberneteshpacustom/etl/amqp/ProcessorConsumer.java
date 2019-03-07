package br.com.alveesrenan.demos.kuberneteshpacustom.etl.amqp;

import org.springframework.amqp.AmqpRejectAndDontRequeueException;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
public class ProcessorConsumer {

    @RabbitListener(queues = "${amqp.queue.name}")
    public void consume(String payload) {
        try {
            TimeUnit.MINUTES.sleep(1);
        } catch (Exception ex) {
            throw new AmqpRejectAndDontRequeueException(String.format("Could not process payload '%s' due to " +
                    "exception '%s'", payload, ex.getMessage()));
        }
    }
}
