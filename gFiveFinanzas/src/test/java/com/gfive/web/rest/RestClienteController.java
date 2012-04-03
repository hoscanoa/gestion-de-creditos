package com.gfive.web.rest;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.client.RestTemplate;

import com.gfive.domain.rest.PedidoList;
import com.gfive.domain.rest.PedidoRest;

@Controller
public class RestClienteController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	private RestTemplate restTemplate = new RestTemplate();
	
	public PedidoList getAll() {
		logger.debug("Recupera todos los pedidos");
		
		List<MediaType> acceptableMediaTypes = new ArrayList<MediaType>();
		acceptableMediaTypes.add(MediaType.APPLICATION_XML);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(acceptableMediaTypes);
		HttpEntity<PedidoRest> entity = new HttpEntity<PedidoRest>(headers);
		
		try {
			ResponseEntity<PedidoList> result = restTemplate.exchange("http://localhost:8080/gFiveFinanzas/gfive/pedidos", HttpMethod.GET, entity, PedidoList.class);
			
			return result.getBody();
			
		} catch (Exception e) {
			logger.error(e);
		}
		return null;
	}

	public PedidoRest getPedido(Long id) {
		logger.debug("Recupera pedido con id: " + id);
		
		List<MediaType> acceptableMediaTypes = new ArrayList<MediaType>();
		acceptableMediaTypes.add(MediaType.APPLICATION_XML);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(acceptableMediaTypes);
		HttpEntity<PedidoRest> entity = new HttpEntity<PedidoRest>(headers);

		try {
			ResponseEntity<PedidoRest> result = restTemplate.exchange("http://localhost:8080/gFiveFinanzas/gfive/pedido/{id}", HttpMethod.GET, entity, PedidoRest.class, id);
			return result.getBody();
			
		} catch (Exception e) {
			logger.error(e);
		}		
		return null;
	}

	public void addPedido(PedidoRest pedidoRest) {
		logger.debug("Agregar nuevo pedido");
		
		List<MediaType> acceptableMediaTypes = new ArrayList<MediaType>();
		acceptableMediaTypes.add(MediaType.APPLICATION_XML);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(acceptableMediaTypes);
		HttpEntity<PedidoRest> entity = new HttpEntity<PedidoRest>(pedidoRest, headers);

		try {
			ResponseEntity<PedidoRest> result = restTemplate.exchange("http://localhost:8080/gFiveFinanzas/gfive/pedido", HttpMethod.POST, entity, PedidoRest.class);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
	public void addPedidos(PedidoList pedidoList) {
		logger.debug("Agregar nuevos pedido");
		
		List<MediaType> acceptableMediaTypes = new ArrayList<MediaType>();
		acceptableMediaTypes.add(MediaType.APPLICATION_XML);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(acceptableMediaTypes);
		HttpEntity<PedidoList> entity = new HttpEntity<PedidoList>(pedidoList, headers);

		try {
			ResponseEntity<PedidoList> result = restTemplate.exchange("http://localhost:8080/gFiveFinanzas/gfive/pedidos", HttpMethod.POST, entity, PedidoList.class);
		} catch (Exception e) {
			logger.error(e);
		}
	}
	
}
