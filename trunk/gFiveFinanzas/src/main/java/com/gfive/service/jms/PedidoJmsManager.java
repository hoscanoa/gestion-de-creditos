package com.gfive.service.jms;

import com.gfive.domain.Asiento;
import com.gfive.domain.Pedido;

public interface PedidoJmsManager {

	public Asiento asientoPara(Pedido pedido);
}