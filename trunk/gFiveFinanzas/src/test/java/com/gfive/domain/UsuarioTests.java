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
		Assert.assertNull(usuario.getNombreUsuario());
		usuario.setNombreUsuario(testNombre);
		Assert.assertEquals(testNombre, usuario.getNombreUsuario());		
	}
	
	@Test
	public void testSetAndGetPassword() {
		String testPassword = "aPassword";
		Assert.assertNull(usuario.getContraseña());
		usuario.setContraseña(testPassword);
		Assert.assertEquals(testPassword, usuario.getContraseña());		
	}

}
