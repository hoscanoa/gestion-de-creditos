package com.gfive.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gfive.service.aplicacion.PedidoManager;

@Controller
public class PedidosAprobadosController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private PedidoManager pedidoManager;
	
	@RequestMapping(value = "pedidosaprobados", method = RequestMethod.GET)	
	public String getAll(Model model) {
		logger.debug("Lee todos los pedidos aprobados de la BD");
		model.addAttribute("aprobados", pedidoManager.getPedidosAprobados());
		return "pedidosaprobados";
	}

	public void setPedidoManager(PedidoManager pedidoManager) {
		this.pedidoManager = pedidoManager;
	}

	public PedidoManager getPedidoManager() {
		return pedidoManager;
	}
}