package com.gfive.jms;

import java.util.List;

import com.gfive.domain.Pedido;

public interface PedidoBatchProcessor{

	void processBatch(List<Pedido> batch);
	
	void processSingle(Pedido pedido);

}
