package com.gfive.service.aplicacion;

import java.io.Serializable;
import java.util.List;

import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;

public interface ClienteManager extends Serializable{
	
	public boolean agregarCliente(String cli_ruc, String cli_razonSocial, float cli_lineaCreditoTotal);
	
	public void aumentarLineaCredito(Cliente cliente, double incremento);
	
	public boolean comprobarLineaCredito(Cliente cliente, double monto);
	
	public boolean comprobarLineaCredito(Pedido pedido);
	
	public Cliente getCliente(Pedido pedido);
	
	public Cliente getCliente(String ruc);
	
	public void actualizarSaldoCredito(Cliente cliente, double reduccion);
	
	public void actualizarSaldoCredito(Pedido pedido);
	
	public List<Cliente> getClientes();
	
	

}
