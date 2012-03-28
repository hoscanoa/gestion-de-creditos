package com.gfive.service.rest;

import java.io.Serializable;
import java.util.List;

import com.gfive.domain.Pedido;
import com.gfive.domain.rest.PedidoList;
import com.gfive.domain.rest.PedidoRest;

public interface PedidoRestManager extends Serializable{
	
	public PedidoList convertirPedidos(List<Pedido> listaPedidos);
	
	public PedidoRest convertirPedido(Pedido pedido);
	
	public PedidoList filtrarPendientes(PedidoList pedidoList);
	
	public PedidoList filtrarObservados(PedidoList pedidoList);
	
	public PedidoList filtrarAprobados(PedidoList pedidoList);	

}
