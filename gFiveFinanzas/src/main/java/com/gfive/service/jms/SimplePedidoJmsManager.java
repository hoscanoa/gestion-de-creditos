package com.gfive.service.jms;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gfive.dao.AsientoDao;
import com.gfive.dao.PedidoDao;
import com.gfive.domain.Asiento;
import com.gfive.domain.Pedido;

@Component
@Service("pedidoJmsManager")
public class SimplePedidoJmsManager implements PedidoJmsManager {

	@Autowired
	private PedidoDao pedidoDao;
	
	@Autowired
	private AsientoDao asientoDao;

	@Transactional
	public Asiento asientoPara(Pedido pedido) {	
		Asiento asiento = new Asiento();
		asiento.setCuentaAbono("70.01.01.cajaBancosSoles");
		asiento.setCuentaCargo("12.01.01.clientes");
		asiento.setDescripcion("asiento generado automáticamente por GFiveFinanzas");
		asiento.setFechaCreacion(new Date());
		asiento.setMontoAbono(pedido.getMontoTotal());
		asiento.setMontoCargo(pedido.getMontoTotal());
		asiento.setReferencia(String.valueOf(pedido.getIdPedido()));		
		return asientoDao.generarAsiento(asiento);
	}
}