package com.gfive.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;
import com.gfive.service.aplicacion.PedidoManager;

@Controller
public class PedidosPendientesController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private PedidoManager pedidoManager;
	
	@RequestMapping(value = "pedidospendientes", method = RequestMethod.GET)	
	public String getAll(Model model) {
		logger.debug("Lee todos los pedidos pendientes de la BD");
		model.addAttribute("pendientes", pedidoManager.getPedidosPendientes());
		return "pedidospendientes";
	}
	
	@RequestMapping(value = "observar", method = RequestMethod.GET)
	public String observarPedido(@RequestParam(value="id",  required=true) Integer id, Model model) {
		logger.debug("Observa pedido con id: " + id);
		Pedido pedido = pedidoManager.getPedido(id);
		pedidoManager.observarPedido(pedido);
		model.addAttribute("pendientes", pedidoManager.getPedidosPendientes());
		return "pedidospendientes";
	}

	public void setPedidoManager(PedidoManager pedidoManager) {
		this.pedidoManager = pedidoManager;
	}

	public PedidoManager getPedidoManager() {
		return pedidoManager;
	}
}