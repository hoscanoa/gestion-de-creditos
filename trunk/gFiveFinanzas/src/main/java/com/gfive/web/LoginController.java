package com.gfive.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.gfive.service.aplicacion.UsuarioManager;

@Controller
public class LoginController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private UsuarioManager usuarioManager;

	@RequestMapping(value = "portada")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		return new ModelAndView();
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loggearUsuario(@ModelAttribute("login") Usuario usuario,
			Model model) {
		logger.debug("Login usuario");

		String nombreUsuario = usuario.getUsuario();
		String password = usuario.getContraseña();
		usuarioManager.login(nombreUsuario, password);
		return "pedidos";
	}

	public void setUsuarioManager(UsuarioManager usuarioManager) {
		this.usuarioManager = usuarioManager;
	}

	public UsuarioManager getUsuarioManager() {
		return usuarioManager;
	}
}