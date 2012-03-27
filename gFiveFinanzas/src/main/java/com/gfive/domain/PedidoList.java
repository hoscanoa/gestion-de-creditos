package com.gfive.domain;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

	@XmlRootElement(name="pedidos")
	public class PedidoList {

		private List<Pedido> data;

		public List<Pedido> getData() {
			return data;
		}

		public void setData(List<Pedido> data) {
			this.data = data;
		}
	}


