package com.gfive.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gfive.domain.Cliente;
import com.gfive.service.aplicacion.ClienteManager;

@Controller
public class LineaCreditoController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private ClienteManager clienteManager;

	@RequestMapping(value = "lineacredito", method = RequestMethod.GET)
	public String getCliente(@RequestParam("id") Long id, Model model) {
		logger.debug("Encuentra cliente con id: " + id);		
		model.addAttribute("cliente", clienteManager.getCliente(id.toString()));
		model.addAttribute("clienteAttribute", new Cliente());
		return "lineacredito";
	}
	
	@RequestMapping(value = "lineacredito/{id}", method = RequestMethod.POST)
	public @ResponseBody String updatePerson(@PathVariable("id") Long id, 
			@RequestBody Cliente cliente) {
		logger.debug("Actualizar linea de credito de cliente");		
		cliente.setCli_ruc(id.toString());
		clienteManager.aumentarLineaCredito(cliente, 999);
		return "home";
    }

	public void setClienteManager(ClienteManager clienteManager) {
		this.clienteManager = clienteManager;
	}

	public ClienteManager getClienteManager() {
		return clienteManager;
	}
}