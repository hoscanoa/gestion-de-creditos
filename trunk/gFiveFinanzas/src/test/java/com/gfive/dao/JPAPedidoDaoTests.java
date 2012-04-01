package com.gfive.dao;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.domain.Pedido;

public class JPAPedidoDaoTests {

	private PedidoDao pedidoDao;
	private Pedido testPedido;

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:test-context.xml");
		pedidoDao = (PedidoDao) context.getBean("pedidoDao");
		testPedido = new Pedido();
		testPedido.setIdPedido(90001);
		testPedido.setSituacion("pendiente");
		testPedido.setMontoTotal(20000);
		testPedido.setCli_ruc("10203040501");
		testPedido.setEstado("1");
	}

	@Test
	public void testGetPedido() throws Exception {
		Pedido resultado = pedidoDao.getPedido(testPedido.getIdPedido());
		Assert.assertEquals(resultado.getCli_ruc(), testPedido.getCli_ruc());
	}

	@Test
	public void testGrabaryRemoverPedido() throws Exception {

		testPedido.setIdPedido(90009);
		pedidoDao.grabarPedido(testPedido);
		Pedido resultado = pedidoDao.getPedido(testPedido.getIdPedido());
		Assert.assertEquals(resultado.getIdPedido(), 90009);
		pedidoDao.eliminarPedido(resultado);
		testPedido.setIdPedido(90009);

	}

	@Test
	public void actualizarPedido() throws Exception {

		testPedido.setSituacion("aprobado");
		pedidoDao.actualizarPedido(testPedido);
		Pedido resultado = pedidoDao.getPedido(testPedido.getIdPedido());
		Assert.assertEquals(resultado.getSituacion(), "aprobado");
		testPedido.setSituacion("pendiente");
		pedidoDao.actualizarPedido(testPedido);
	}

	@Test
	public void getPedidosTodos() throws Exception {

		List<Pedido> listaTodos = pedidoDao.getPedidosTodos();
		List<Pedido> listaAprobados = pedidoDao.getPedidosAprobados();
		List<Pedido> listaPendientes = pedidoDao.getPedidosPendientes();
		List<Pedido> listaObservados = pedidoDao.getPedidosObservados();
		Assert.assertNotNull(listaTodos);
		Assert.assertEquals(listaAprobados.size()+listaPendientes.size()+listaObservados.size(),listaTodos.size());
	}
	
	@Test
	public void getPedidosPendientesPorCliente() throws Exception {

		List<Pedido> listaPendientes = pedidoDao.getPedidosPendientes();
		List<Pedido> listaPendientesPorCliente = pedidoDao.getPedidosPendientesPorCliente("10203040501");
		List<Pedido> result = new ArrayList<Pedido>();
		for(Pedido pedido:listaPendientes){
			if(pedido.getCli_ruc().equals("10203040501")){
				result.add(pedido);
			}
		}
		Assert.assertEquals(listaPendientesPorCliente.size(),result.size());
	}

}