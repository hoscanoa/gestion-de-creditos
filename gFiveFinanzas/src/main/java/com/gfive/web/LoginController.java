package com.gfive.web;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gfive.service.aplicacion.UsuarioManager;

@Controller
public class LoginController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private UsuarioManager usuarioManager;
	
	@RequestMapping(value="/portada.htm")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String now = (new Date()).toString();
        logger.info("Returning portada view with "+now);
        
        Map<String,Object> myModel = new HashMap<String, Object>();
        myModel.put("now", now);
        myModel.put("usuario",this.usuarioManager.login("CESAR", "CESAR"));

        return new ModelAndView("portada","model",myModel);
    }
	
	public void setUsuarioManager(UsuarioManager usuarioManager){
		this.usuarioManager = usuarioManager;
	}
}