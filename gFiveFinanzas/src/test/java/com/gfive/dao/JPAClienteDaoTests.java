package com.gfive.dao;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.domain.Cliente;

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
        testCliente.setCli_lineaCreditoTotal(50000.00f);
        testCliente.setCli_lineaCreditoSaldo(50000.00f);
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
        
    }
    
}