package com.gfive.dao;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.domain.Usuario;

public class JPAUsuarioDaoTests {

    private UsuarioDao usuarioDao;
    private String nombre;
    private String password;

    @Before
    public void setUp() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:test-context.xml");
        usuarioDao = (UsuarioDao) context.getBean("usuarioDao");
        nombre = "MIGUEL";
        password = "MIGUEL";
    }

    @Test
    public void testConfirmarUsuario() throws Exception {
			Usuario resultado;
			resultado = usuarioDao.getUsuario(nombre, password);
			Assert.assertEquals(resultado.getNombreUsuario() , "MIGUEL");
    }
}