package com.gfive.web.rest;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gfive.domain.rest.PedidoList;
import com.gfive.domain.rest.PedidoRest;
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
	public @ResponseBody PedidoList getPedidos() {
		logger.debug("Finanzas ha recibido solicitud para obtener todos los Pedidos");

		PedidoList result = new PedidoList();
		result = pedidoRestManager.convertirPedidos(pedidoManager.getPedidosTodos());

		return result;
	}

	@RequestMapping(value = "/pedido/{id}", method = RequestMethod.GET, headers = "Accept=application/xml, application/json")
	public @ResponseBody PedidoRest getPedido(@PathVariable("id") int id) {
		logger.debug("Finanzas ha recibido solicitud para obtener el Pedidos con id: "+ id);
		PedidoRest result = pedidoRestManager.convertirPedido(pedidoManager.getPedido(id));

		return result;
	}

	@RequestMapping(value = "/pedidos", method = RequestMethod.POST, headers = "Accept=application/xml, application/json")
	public @ResponseBody void addPedidos(@RequestBody PedidoList listaPedidos) {
		logger.debug("Finanzas ha recibido solicitud para agregar nuevos pedidos");

		pedidoRestManager.agregarNuevos(listaPedidos.getData());
	}
	
	@RequestMapping(value = "/pedido", method = RequestMethod.POST, headers="Accept=application/xml, application/json")
	public @ResponseBody void addPedido(@RequestBody PedidoRest pedidoRest) {
		logger.debug("Finanzas ha recibido solicitud para agregar un nuevos pedido");
		
		pedidoRestManager.agregarNuevo(pedidoRest);
	}

}
