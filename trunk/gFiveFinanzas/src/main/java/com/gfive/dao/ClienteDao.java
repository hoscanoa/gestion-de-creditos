package com.gfive.dao;

import com.gfive.domain.Cliente;

public interface ClienteDao {
	
	public Cliente getCliente(String ruc) throws Exception;
	
	public void grabarCliente(Cliente cliente);
	
	public void actualizarCliente(Cliente cliente);

}
