package com.gfive.web.rest;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gfive.domain.rest.PedidoList;
import com.gfive.service.aplicacion.PedidoManager;
import com.gfive.service.rest.PedidoRestManager;

@Controller
public class RestProveedorController {

	protected static Logger logger = Logger.getLogger("controller");

	@Resource(name = "pedidoManager")
	private PedidoManager pedidoManager;
	
	@Resource(name = "pedidoRestManager")
	private PedidoRestManager pedidoRestManager;

	@RequestMapping(value = "/pedidos", method = RequestMethod.GET, headers = "Accept=application/xml, application/json")
	public @ResponseBody
	PedidoList getPedidos() {
		logger.debug("Provider has received request to get all pedidos");

		PedidoList result = new PedidoList();
		result = pedidoRestManager.convertirPedidos(pedidoManager.getPedidosTodos());

		return result;
	}
}
