package com.gfive.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gfive.service.aplicacion.ClienteManager;

@Controller
public class VistaClientesController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private ClienteManager clienteManager;

	@RequestMapping(value = "vistaclientes", method = RequestMethod.GET)	
	public String getAll(Model model) {
		logger.debug("Lee todos los clientes de la BD");
		model.addAttribute("clientes", clienteManager.getClientes());
		return "vistaclientes";
	}
	
	public void setClienteManager(ClienteManager clienteManager) {
		this.clienteManager = clienteManager;
	}

	public ClienteManager getClienteManager() {
		return clienteManager;
	}
}