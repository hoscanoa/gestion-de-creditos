package com.gfive.service.aplicacion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gfive.dao.ClienteDao;
import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;

@Component
public class SimpleClienteManager implements ClienteManager {

	@Autowired
	private ClienteDao clienteDao;

	public void setClienteDao(ClienteDao clienteDao) {
		this.clienteDao = clienteDao;
	}

	private boolean clienteExiste(String ruc) {
		boolean flag = false;
		try {
			if (clienteDao.getCliente(ruc) != null) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean agregarCliente(String cli_ruc, String cli_razonSocial,float cli_lineaCreditoTotal) {
			if (clienteExiste(cli_ruc)) {
				Cliente cliente = new Cliente();
				cliente.setCli_ruc(cli_ruc);
				cliente.setCli_razonSocial(cli_razonSocial);
				cliente.setCli_lineaCreditoTotal(cli_lineaCreditoTotal);
				cliente.setCli_lineaCreditoSaldo(cli_lineaCreditoTotal);
				cliente.setEstado("1");
				clienteDao.grabarCliente(cliente);
				return true;
			} else {
				System.out.println("cliente ya existe");
				return false;
			}
		
	}

	public void aumentarLineaCredito(Cliente cliente, double incremento) {
		cliente.setCli_lineaCreditoTotal(cliente.getCli_lineaCreditoTotal() + (float) incremento);
		cliente.setCli_lineaCreditoSaldo(cliente.getCli_lineaCreditoSaldo() + (float) incremento);
		clienteDao.actualizarCliente(cliente);
	}

	public boolean comprobarLineaCredito(Cliente cliente, double monto) {
		if(cliente.getCli_lineaCreditoSaldo() >= monto){
			return true;
		} else {
			return false;
		}		
	}

	public boolean comprobarLineaCredito(Pedido pedido) {
		Cliente cliente;
		try {
			cliente = clienteDao.getCliente(pedido.getCli_ruc());
			if(cliente.getCli_lineaCreditoSaldo() >= (float) pedido.getMontoTotal()){
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}return false;		
	}

	public Cliente getCliente(Pedido pedido) {
		try {
			return clienteDao.getCliente(pedido.getCli_ruc());
		} catch (Exception e) {
			e.printStackTrace();
		} return null;
	}

	public Cliente getCliente(String ruc) {
		try {
			return clienteDao.getCliente(ruc);
		} catch (Exception e) {
			e.printStackTrace();
		} return null;
	}

	public void actualizarSaldoCredito(Cliente cliente, double reduccion) {
		cliente.setCli_lineaCreditoSaldo(cliente.getCli_lineaCreditoSaldo() - (float)reduccion);
		clienteDao.actualizarCliente(cliente);
	}
	
	public List<Cliente> getClientes() {
		return clienteDao.getClientes();
	}


}
