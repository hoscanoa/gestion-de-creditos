package com.gfive.dao;

import java.util.List;

import com.gfive.domain.Pedido;

public interface PedidoDao {
	
	public Pedido getPedido(int idPedido) throws Exception;
	
	public void grabarPedido(Pedido pedido);
	
	public void actualizarPedido(Pedido pedido);
	
	public List<Pedido> getPedidosAprobados();
	
	public List<Pedido> getPedidosObservados();
	
	public List<Pedido> getPedidosPendientes();
	
	public List<Pedido> getPedidosTodos();
	
	public void eliminarPedido(Pedido pedido);

}
