package com.gfive.web;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.gfive.dao.InMemoryUsuarioDao;
import com.gfive.service.aplicacion.SimpleUsuarioManager;

public class LoginControllerTests {

	@Test
	public void testHandleRequestView() throws Exception {
		LoginController controller = new LoginController();
		SimpleUsuarioManager spm = new SimpleUsuarioManager();
        spm.setUsuarioDao(new InMemoryUsuarioDao());
        controller.setUsuarioManager(spm);
		ModelAndView modelAndView = controller.handleRequest(null, null);
		Assert.assertEquals("portada", modelAndView.getViewName());
		Assert.assertNotNull(modelAndView.getModel());
	}

}
