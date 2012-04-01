package com.gfive.service.aplicacion;

import java.io.Serializable;
import java.util.List;

import com.gfive.domain.Pedido;

public interface PedidoManager extends Serializable{
	
	public void agregarPedido(int idPedido, double montoTotal, String cli_ruc) throws Exception;
	
	public boolean aprobarPedido(Pedido pedido);
	
	public void observarPedido(Pedido pedido);
	
	public Pedido getPedido(int idPedido);
	
	public List<Pedido> getPedidosTodos();
	
	public List<Pedido> getPedidosPendientes();
	
	public List<Pedido> getPedidosObservados();
	
	public List<Pedido> getPedidosAprobados();
	
	public void aprobarPendientesPorCliente(String cli_ruc);
	
	

}
