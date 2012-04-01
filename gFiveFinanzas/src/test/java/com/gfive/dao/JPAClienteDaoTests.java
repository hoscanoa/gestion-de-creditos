package com.gfive.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.domain.Cliente;
import com.gfive.domain.Pedido;

public class JPAClienteDaoTests {

    private ClienteDao clienteDao;
	private Cliente testCliente;

    @Before
    public void setUp() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:test-context.xml");
        clienteDao = (ClienteDao) context.getBean("clienteDao");
        testCliente = new Cliente();
        testCliente.setCli_ruc("10203040501");
        testCliente.setCli_razonSocial("CLIENTE DE PRUEBA");
        testCliente.setCli_lineaCreditoTotal(10000.00f);
        testCliente.setCli_lineaCreditoSaldo(10000.00f);
        testCliente.setEstado("1");        
    }

    @Test
    public void testGetCliente() throws Exception {
			Cliente resultado;
			resultado = clienteDao.getCliente(testCliente.getCli_ruc());
			Assert.assertEquals(resultado.getCli_razonSocial() , testCliente.getCli_razonSocial());
    }
    
	@Test
    public void testGrabaryRemoverCliente() throws Exception {

        testCliente.setCli_ruc("10203040502");
        clienteDao.grabarCliente(testCliente);
        Cliente resultado = clienteDao.getCliente(testCliente.getCli_ruc());
        Assert.assertEquals(resultado.getCli_ruc(),"10203040502");
        clienteDao.eliminarCliente(resultado);
        testCliente.setCli_ruc("10203040501");
        
    }
	
	@Test
    public void actualizarCliente() throws Exception {

        testCliente.setCli_lineaCreditoSaldo(70000.00f);
        testCliente.setCli_lineaCreditoTotal(90000.00f);
        clienteDao.actualizarCliente(testCliente);
        Cliente resultado = clienteDao.getCliente(testCliente.getCli_ruc());
        Assert.assertEquals(resultado.getCli_lineaCreditoSaldo(),70000.00, 0.0);
        Assert.assertEquals(resultado.getCli_lineaCreditoTotal(),90000.00, 0.0);  
        testCliente.setCli_lineaCreditoSaldo(10000.00f);
        testCliente.setCli_lineaCreditoTotal(10000.00f);
        clienteDao.actualizarCliente(testCliente);
    }
	
	@Test
	public void getClientes(){

		List<Cliente> listaTodos = clienteDao.getClientes();
		Assert.assertNotNull(listaTodos);
	}
    
}