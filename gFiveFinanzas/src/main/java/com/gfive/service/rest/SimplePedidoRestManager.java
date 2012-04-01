package com.gfive.service.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.gfive.dao.PedidoDao;
import com.gfive.domain.Pedido;
import com.gfive.domain.rest.PedidoList;
import com.gfive.domain.rest.PedidoRest;
import com.gfive.service.aplicacion.SimpleClienteManager;

@Component
@Service("pedidoRestManager")
public class SimplePedidoRestManager implements PedidoRestManager {
	
	@Autowired
	private SimpleClienteManager clienteManager;
	
	@Autowired
	private PedidoDao pedidoDao;

	public void setPedidoDao(PedidoDao pedidoDao) {
		this.pedidoDao = pedidoDao;
	}

	public PedidoList convertirPedidos(List<Pedido> listaPedidos) {
		List<PedidoRest> prl = new ArrayList<PedidoRest>();
		for (Pedido pedido : listaPedidos) {
			PedidoRest pr = new PedidoRest();
			pr.setIdPedido(pedido.getIdPedido());
			pr.setCli_ruc(pedido.getCli_ruc());
			pr.setMontoTotal(pedido.getMontoTotal());
			pr.setSituacion(pedido.getSituacion());
			prl.add(pr);
		}
		PedidoList pl = new PedidoList();
		pl.setData(prl);
		return pl;
	}

	public PedidoRest convertirPedido(Pedido pedido) {
		PedidoRest pr = new PedidoRest();
		pr.setIdPedido(pedido.getIdPedido());
		pr.setCli_ruc(pedido.getCli_ruc());
		pr.setMontoTotal(pedido.getMontoTotal());
		pr.setSituacion(pedido.getSituacion());
		return pr;
	}

	public PedidoList filtrarPendientes(PedidoList pedidoList) {
		List<PedidoRest> prl = new ArrayList<PedidoRest>();
		for (PedidoRest pedido : pedidoList.getData()) {
			if(pedido.getSituacion().equals("pendiente")){
				prl.add(pedido);
			}
		}
		PedidoList pl = new PedidoList();
		pl.setData(prl);
		return pl;
	}

	public PedidoList filtrarObservados(PedidoList pedidoList) {
		List<PedidoRest> prl = new ArrayList<PedidoRest>();
		for (PedidoRest pedido : pedidoList.getData()) {
			if(pedido.getSituacion().equals("observado")){
				prl.add(pedido);
			}
		}
		PedidoList pl = new PedidoList();
		pl.setData(prl);
		return pl;
	}

	public PedidoList filtrarAprobados(PedidoList pedidoList) {
		List<PedidoRest> prl = new ArrayList<PedidoRest>();
		for (PedidoRest pedido : pedidoList.getData()) {
			if(pedido.getSituacion().equals("aprobado")){
				prl.add(pedido);
			}
		}
		PedidoList pl = new PedidoList();
		pl.setData(prl);
		return pl;
	}

	public void agregarNuevos(List<PedidoRest> listaPedidos) {
		for(PedidoRest pedidoRest: listaPedidos){
			agregarNuevo(pedidoRest);
		}
		
	}

	public void agregarNuevo(PedidoRest pedidoRest) {
		if(verificarExistenciaPedido(pedidoRest)){
			Pedido p = new Pedido();
			p.setIdPedido(pedidoRest.getIdPedido());
			p.setCli_ruc(pedidoRest.getCli_ruc());
			p.setMontoTotal(pedidoRest.getMontoTotal());
			p.setSituacion(pedidoRest.getSituacion());
			p.setEstado("1");
			pedidoDao.grabarPedido(p);
			if(!clienteManager.agregarCliente(p.getCli_ruc(), "default", 0)){
				clienteManager.actualizarSaldoCredito(p);
			}
		} else {
			System.out.println("pedido "+pedidoRest.getIdPedido()+ " ya existe");
		}
	}
	
	private boolean verificarExistenciaPedido(PedidoRest pedidoRest){
		List<Pedido> existentes = pedidoDao.getPedidosTodos();
		for(Pedido pedido: existentes){
			if(pedido.getIdPedido() == pedidoRest.getIdPedido()){
				return false;
			}
		}
		return true;
	}
	
}
