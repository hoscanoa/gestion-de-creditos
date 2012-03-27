package com.gfive.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gfive.domain.Usuario;
import com.gfive.service.aplicacion.ClienteManager;
import com.gfive.service.aplicacion.PedidoManager;
import com.gfive.service.aplicacion.UsuarioManager;

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