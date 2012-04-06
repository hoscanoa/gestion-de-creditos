package com.gfive.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gfive.domain.Asiento;
import com.gfive.domain.Pedido;

public class JPAAsientoDaoTests {

	private AsientoDao asientoDao;
	private Asiento testAsiento;

	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:test-context.xml");
		asientoDao = (AsientoDao) context.getBean("asientoDao");
		testAsiento = new Asiento();
		testAsiento.setCuentaAbono("cuenta abono");
		testAsiento.setCuentaCargo("cuenta cargo");
		testAsiento.setDescripcion("descripcion");
		testAsiento.setFechaCreacion(new Date());
		testAsiento.setMontoAbono(10000);
		testAsiento.setMontoCargo(10000);
		testAsiento.setReferencia("99901");
	}
	
	@After
	public void tearDown(){
		asientoDao.eliminarAsiento("99901");
		
	}

	@Test
	public void testGeneraryGetAsiento() throws Exception {
		asientoDao.generarAsiento(testAsiento);
		Asiento result = asientoDao.getAsiento("99901");
		SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
		Assert.assertEquals(formateador.format(new Date()), formateador.format(result.getFechaCreacion()));
	}

}