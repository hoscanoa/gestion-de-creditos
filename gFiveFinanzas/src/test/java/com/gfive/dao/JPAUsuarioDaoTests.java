package com.gfive.dao;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.domain.Usuario;

public class JPAUsuarioDaoTests {

    private UsuarioDao usuarioDao;
    private Usuario usuario;

    @Before
    public void setUp() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:test-context.xml");
        usuarioDao = (UsuarioDao) context.getBean("usuarioDao");
        usuario = new Usuario();
        usuario.setUsuario("CESAR");
        usuario.setContraseña("CESAR");
        usuario.setIdUsuario(0);
        usuario.setIdPerfilUsuario(0);
        
    }

    @Test
    public void testConfirmarUsuario() {        
		try {
			Usuario resultado;
			resultado = usuarioDao.confirmarUsuario(usuario);
			Assert.assertEquals(resultado.getUsuario() , "CESAR");	
		} catch (Exception e) {
			e.printStackTrace();
		}
           
    }
}