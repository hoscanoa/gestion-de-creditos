package com.gfive.domain;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class UsuarioTests {

	private Usuario usuario;

	@Before
	public void setUp() throws Exception {
		usuario = new Usuario();
	}
	
	@Test
	public void testSetAndGetNombre() {
		String testNombre = "aNombre";
		Assert.assertNull(usuario.getUsuario());
		usuario.setUsuario(testNombre);
		Assert.assertEquals(testNombre, usuario.getUsuario());		
	}
	
	@Test
	public void testSetAndGetPassword() {
		String testPassword = "aPassword";
		Assert.assertNull(usuario.getContraseña());
		usuario.setContraseña(testPassword);
		Assert.assertEquals(testPassword, usuario.getContraseña());		
	}

}
