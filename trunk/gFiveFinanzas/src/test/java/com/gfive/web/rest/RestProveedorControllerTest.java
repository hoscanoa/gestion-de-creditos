package com.gfive.web.rest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.dao.ClienteDao;
import com.gfive.dao.PedidoDao;
import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;
import com.gfive.domain.rest.PedidoList;
import com.gfive.domain.rest.PedidoRest;

public class RestProveedorControllerTest {

	private RestClienteController clientePrueba;
	private PedidoDao pedidoDao;
	private ClienteDao clienteDao;

	private PedidoRest prueba1;
	private PedidoRest prueba2;
	private PedidoList listaPrueba;

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:test-context.xml");
		pedidoDao = (PedidoDao) context.getBean("pedidoDao");
		clienteDao = (ClienteDao) context.getBean("clienteDao");
		clientePrueba = new RestClienteController();
		prueba1 = new PedidoRest();
		prueba1.setIdPedido(99001);
		prueba1.setCli_razonSocial("testCliente");
		prueba1.setCli_ruc("10203040502");
		prueba1.setMontoTotal(20000);
		prueba1.setSituacion("pendiente");
		prueba2 = new PedidoRest();
		prueba2.setIdPedido(99002);
		prueba2.setCli_razonSocial("testCliente");
		prueba2.setCli_ruc("10203040502");
		prueba2.setMontoTotal(10000);
		prueba2.setSituacion("pendiente");
		List<PedidoRest> lista = new ArrayList<PedidoRest>();
		lista.add(prueba1);
		lista.add(prueba2);
		listaPrueba = new PedidoList();
		listaPrueba.setData(lista);
	}
	
	@After
	public void tearDown(){
		clienteDao.eliminarCliente(prueba1.getCli_ruc());
		pedidoDao.eliminarPedido(prueba1.getIdPedido());
		pedidoDao.eliminarPedido(prueba2.getIdPedido());
		
	}

	@Test
	public void addPedidoTest() throws Exception {
		clientePrueba.addPedido(prueba1);
		Pedido pedidoResult = pedidoDao.getPedido(99001);
		assertEquals(pedidoResult.getCli_ruc(), "10203040502");
		Cliente clienteResult = clienteDao.getCliente("10203040502");
		assertEquals(clienteResult.getCli_razonSocial(), "testCliente");
	}

	@Test
	public void addPedidosTest() throws Exception {
		clientePrueba.addPedidos(listaPrueba);
		Pedido pedidoResult = pedidoDao.getPedido(99001);
		assertEquals(pedidoResult.getMontoTotal(), 20000,0);
		Pedido pedidoResult2 = pedidoDao.getPedido(99002);
		assertEquals(pedidoResult2.getMontoTotal(), 10000,0);
	}

	@Test
	public void getPedidoTest() {
		clientePrueba.addPedidos(listaPrueba);
		PedidoRest result = clientePrueba.getPedido((long) 99001);
		assertEquals(result.getCli_razonSocial(), "testCliente");
	}

	@Test
	public void getPedidosTest() {
		PedidoList result = clientePrueba.getAll();
		List<Pedido> expected = pedidoDao.getPedidosTodos();
		assertEquals(result.getData().size(), expected.size());
	}

}
