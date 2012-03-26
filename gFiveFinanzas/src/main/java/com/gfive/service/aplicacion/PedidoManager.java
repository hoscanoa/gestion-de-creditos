package com.gfive.service.aplicacion;

import java.io.Serializable;
import java.util.List;

import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;

public interface PedidoManager extends Serializable{
	
	public void agregarPedido(int idPedido, String situacion, double montoTotal, String cli_ruc);
	
	public Cliente getCliente(Pedido pedido);
	
	public void aprobarPedido(Pedido pedido);
	
	public void observarPedido(Pedido pedido);
	
	public boolean comprobarLineaCreditoCliente(Pedido pedido);
}
