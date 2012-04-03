package com.gfive.dao;

import java.util.List;

import com.gfive.domain.Cliente;

public interface ClienteDao {
	
	public Cliente getCliente(String ruc);
	
	public List<Cliente> getClientes();
	
	public void grabarCliente(Cliente cliente);
	
	public void actualizarCliente(Cliente cliente);
	
	public void eliminarCliente(Cliente cliente);
	
	public void eliminarCliente(String cli_ruc);

}
