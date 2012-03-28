package com.gfive.domain.rest;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

	@XmlRootElement(name="pedidos")
	public class PedidoList {

		private List<PedidoRest> data;

		public List<PedidoRest> getData() {
			return data;
		}

		public void setData(List<PedidoRest> data) {
			this.data = data;
		}
	}


