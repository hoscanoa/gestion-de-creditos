package com.gfive.jms;

import java.util.List;

import org.springframework.jms.core.JmsTemplate;

import com.gfive.domain.Pedido;


/**
 * A batch processor that sends dining event notifications via JMS.
 */
public class JmsPedidoBatchProcessor implements PedidoBatchProcessor {

	private JmsTemplate jmsTemplate;

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	public void processBatch(List<Pedido> batch) {
		for(Pedido pedido: batch){
			jmsTemplate.convertAndSend(pedido);
		}
	}
}
