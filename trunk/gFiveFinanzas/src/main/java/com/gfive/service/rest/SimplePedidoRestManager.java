package com.gfive.service.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.gfive.domain.Pedido;
import com.gfive.domain.rest.PedidoList;
import com.gfive.domain.rest.PedidoRest;

@Component
@Service("pedidoRestManager")
public class SimplePedidoRestManager implements PedidoRestManager {

	public PedidoList convertirPedidos(List<Pedido> listaPedidos) {
		List<PedidoRest> prl = new ArrayList<PedidoRest>();
		for (Pedido pedido : listaPedidos) {
			PedidoRest pr = new PedidoRest();
			pr.setIdPedido(pedido.getIdPedido());
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

	
}
