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
import com.gfive.service.aplicacion.ClienteManager;
import com.gfive.service.aplicacion.PedidoManager;

@Controller
public class LineaCreditoController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private ClienteManager clienteManager;
	
	@Autowired
	private PedidoManager pedidoManager;

	@RequestMapping(value = "lineacredito", method = RequestMethod.GET)
	public String getCliente(@RequestParam("id") Long id, Model model) {
		logger.debug("Encuentra cliente con id: " + id);
		model.addAttribute("cliente", clienteManager.getCliente(id.toString()));
		model.addAttribute("clienteAttribute", new Cliente());
		return "lineacredito";
	}

	@RequestMapping(value = "lineacredito", method = RequestMethod.POST)
	public String updatePerson(@RequestParam(value="id",  required=true) String id,
			Cliente cliente) {		
		logger.debug("Actualizar linea de credito de cliente");
		Cliente cl = clienteManager.getCliente(id);
		double incremento = cliente.getCli_lineaCreditoTotal() - cl.getCli_lineaCreditoTotal();		
		clienteManager.aumentarLineaCredito(cl, incremento);
		pedidoManager.aprobarPendientesPorCliente(cl.getCli_ruc());
		return "home";
	}

	public void setClienteManager(ClienteManager clienteManager) {
		this.clienteManager = clienteManager;
	}

	public ClienteManager getClienteManager() {
		return clienteManager;
	}
}