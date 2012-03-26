package com.gfive.service.aplicacion;

import java.io.Serializable;
import java.util.List;

import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;

public interface ClienteManager extends Serializable{
	
	public void agregarCliente(String cli_ruc, String cli_razonSocial, float cli_lineaCreditoTotal);
	
	public void aumentarLineaCredito(Cliente cliente, double incremento);
	
	public boolean comprobarLineaCredito(Cliente cliente, double monto);
	
	public void actualizarSaldoCredito(Cliente cliente, double monto);
	
	public List<Pedido> getPedidosTodos();
	
	public List<Pedido> getPedidosPendientes();
	
	public List<Pedido> getPedidosObservados();
	
	public List<Pedido> getPedidosAprobados();
}
