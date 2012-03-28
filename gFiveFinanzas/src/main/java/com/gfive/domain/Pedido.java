package com.gfive.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="Pedido")
public class Pedido implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private int idPedido;

	private String situacion;
	private float montoTotal;
	private String cli_ruc;
	private String estado;
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
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
	public float getMontoTotal() {
		return montoTotal;
	}
	public void setMontoTotal(float montoTotal) {
		this.montoTotal = montoTotal;
	}
	public String getCli_ruc() {
		return cli_ruc;
	}
	public void setCli_ruc(String cli_ruc) {
		this.cli_ruc = cli_ruc;
	}
	
	
}
