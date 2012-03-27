package com.gfive.service.aplicacion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gfive.dao.PedidoDao;
import com.gfive.domain.Pedido;

@Component
public class SimplePedidoManager implements PedidoManager {

	@Autowired
	private PedidoDao pedidoDao;

	public void setPedidoDao(PedidoDao pedidoDao) {
		this.pedidoDao = pedidoDao;
	}

	private boolean pedidoExiste(int idPedido) {
		boolean flag = false;
		try {
			if (pedidoDao.getPedido(idPedido) != null) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public void agregarPedido(int idPedido, double montoTotal, String cli_ruc)
			throws Exception {
		try {
			if (pedidoExiste(idPedido)) {
				Pedido pedido = new Pedido();
				pedido.setIdPedido(idPedido);
				pedido.setSituacion("pendiente");
				pedido.setCli_ruc(cli_ruc);
				pedido.setMontoTotal((float) montoTotal);
				pedido.setEstado("1");
				pedidoDao.grabarPedido(pedido);
			} else {
				throw new Exception("pedido ya existe");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void aprobarPedido(Pedido pedido) {
		if (pedidoExiste(pedido.getIdPedido())
				&& pedido.getSituacion().equals("pendiente")) {
			pedido.setSituacion("aprobado");
			pedidoDao.actualizarPedido(pedido);
		}
	}

	public void observarPedido(Pedido pedido) {
		if (pedidoExiste(pedido.getIdPedido())
				&& pedido.getSituacion().equals("pendiente")) {
			pedido.setSituacion("observado");
			pedidoDao.actualizarPedido(pedido);
		}
	}

	public Pedido getPedido(int idPedido){
		try {
			return pedidoDao.getPedido(idPedido);
		} catch (Exception e) {
			e.printStackTrace();
		} return null;
	}
	
	public List<Pedido> getPedidosTodos() {
		return pedidoDao.getPedidosTodos();
	}

	public List<Pedido> getPedidosPendientes() {
		return pedidoDao.getPedidosPendientes();
	}

	public List<Pedido> getPedidosObservados() {
		return pedidoDao.getPedidosObservados();
	}

	public List<Pedido> getPedidosAprobados() {
		return pedidoDao.getPedidosAprobados();
	}

}
