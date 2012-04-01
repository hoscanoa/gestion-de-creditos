package com.gfive.domain.rest;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="pedido")
public class PedidoRest implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int idPedido;
	private String situacion;
	private String cli_ruc;
	private float montoTotal;
	
	public int getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}
	public String getSituacion() {
		return situacion;
	}
	public void setSituacion(String situacion) {
		this.situacion = situacion;
	}
	public String getCli_ruc() {
		return cli_ruc;
	}
	public void setCli_ruc(String cli_ruc) {
		this.cli_ruc = cli_ruc;
	}
	public float getMontoTotal() {
		return montoTotal;
	}
	public void setMontoTotal(float montoTotal) {
		this.montoTotal = montoTotal;
	}
	
}
