package com.gfive.jms;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gfive.dao.AsientoDao;
import com.gfive.domain.Pedido;


/**
 * Tests the Dining batch processor
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/test-context.xml",
					"classpath:jms/client/client-config.xml", 
					"classpath:jms/jms-asientos-config.xml",
					"classpath:jms/jms-infrastructure-config.xml"})


public class PedidoBatchProcessorTests extends AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	private PedidoBatchProcessor pedidoBatchProcessor;

	@Autowired
	private ConfirmacionAsientoLogger confirmationLogger;
	
	private AsientoDao asientoDao;
	private Pedido testPedido;
	private List<Pedido> batch;
	
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"classpath:test-context.xml");
		asientoDao = (AsientoDao) context.getBean("asientoDao");
		testPedido = new Pedido();
		testPedido.setIdPedido(99901);
		testPedido.setSituacion("pendiente");
		testPedido.setMontoTotal(20000);
		testPedido.setCli_ruc("10203040501");
		testPedido.setEstado("1");
		batch = new ArrayList<Pedido>();
		batch.add(testPedido);
	}
	
	@After
	public void tearDown(){
		asientoDao.eliminarAsiento("99901");
		
	}
	
	@Test
	public void testBatch() throws Exception {

		pedidoBatchProcessor.processBatch(batch);
		waitForBatch(batch.size(), 1000);
		assertEquals(batch.size(), confirmationLogger.getConfirmations().size());
	}

	private void waitForBatch(int batchSize, int timeout) throws InterruptedException {
		int sleepTime = 100;
		while (confirmationLogger.getConfirmations().size() < batchSize && timeout > 0) {
			Thread.sleep(sleepTime);
			timeout -= sleepTime;
		}
	}
}
