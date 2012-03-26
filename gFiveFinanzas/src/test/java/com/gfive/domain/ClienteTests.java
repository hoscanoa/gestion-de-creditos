package com.gfive.domain;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class ClienteTests {

	private Cliente cliente;

	@Before
	public void setUp() throws Exception {
		cliente = new Cliente();
	}
	
	@Test
	public void testSetAndGetRazonSocial() {
		String testRzonSocial = "aRazonSocial";
		Assert.assertNull(cliente.getCli_razonSocial());
		cliente.setCli_razonSocial(testRzonSocial);
		Assert.assertEquals(testRzonSocial, cliente.getCli_razonSocial());		
	}
	
	@Test
	public void testSetAndGetLineaCreditoTotal() {
		float testLineaCreditoTotal = 10000.00f;
		Assert.assertEquals(cliente.getCli_lineaCreditoTotal(), 0.00,0.00);
		cliente.setCli_lineaCreditoTotal(testLineaCreditoTotal);
		Assert.assertEquals(testLineaCreditoTotal, cliente.getCli_lineaCreditoTotal(), 0.00);		
	}

}
