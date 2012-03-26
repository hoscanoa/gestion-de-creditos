package com.gfive.domain;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class PedidoTests {

	private Pedido pedido;

	@Before
	public void setUp() throws Exception {
		pedido = new Pedido();
	}
	
	@Test
	public void testSetAndGetMontoTotal() {
		float testMontoTotal = 10000.00f;
		Assert.assertEquals(pedido.getMontoTotal(), 0.00,0.00);
		pedido.setMontoTotal(testMontoTotal);
		Assert.assertEquals(testMontoTotal, pedido.getMontoTotal(), 0.00);		
	}
	
	@Test
	public void testSetandGetIdPedido() {
		int testIdPedido = 999;
		Assert.assertEquals(pedido.getIdPedido(), 0);
		pedido.setIdPedido(testIdPedido);
		Assert.assertEquals(testIdPedido, pedido.getIdPedido(), 0);		
	}
	
	@Test
	public void testSetAndGetSituacion() {
		String testSituacion = "pendiente";
		Assert.assertNull(pedido.getSituacion());
		pedido.setSituacion(testSituacion);
		Assert.assertEquals(testSituacion, pedido.getSituacion());		
	}

}
