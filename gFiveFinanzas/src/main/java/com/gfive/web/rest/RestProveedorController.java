package com.gfive.web.rest;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gfive.domain.PedidoList;
import com.gfive.service.aplicacion.PedidoManager;

@Controller
public class RestProveedorController {
	
protected static Logger logger = Logger.getLogger("controller");
	
	@Resource(name="pedidoManager")
	private PedidoManager pedidoManager;

	@RequestMapping(value = "/pedidos", 
			method = RequestMethod.GET, 
			headers="Accept=application/xml, application/json")
public @ResponseBody PedidoList getPedidos() {
logger.debug("Provider has received request to get all pedidos");

// Call service here
PedidoList result = new PedidoList();
result.setData(pedidoManager.getPedidosTodos());

return result;
}
}
