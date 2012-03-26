package com.gfive.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Cliente")
public class Cliente implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private String cli_ruc;

	private String cli_razonSocial;
	private float cli_lineaCreditoTotal;
	private float cli_lineaCreditoSaldo;
	private String estado;
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getCli_ruc() {
		return cli_ruc;
	}
	public void setCli_ruc(String cli_ruc) {
		this.cli_ruc = cli_ruc;
	}
	public String getCli_razonSocial() {
		return cli_razonSocial;
	}
	public void setCli_razonSocial(String cli_razonSocial) {
		this.cli_razonSocial = cli_razonSocial;
	}
	public float getCli_lineaCreditoTotal() {
		return cli_lineaCreditoTotal;
	}
	public void setCli_lineaCreditoTotal(float cli_lineaCreditoTotal) {
		this.cli_lineaCreditoTotal = cli_lineaCreditoTotal;
	}
	public float getCli_lineaCreditoSaldo() {
		return cli_lineaCreditoSaldo;
	}
	public void setCli_lineaCreditoSaldo(float cli_lineaCreditoSaldo) {
		this.cli_lineaCreditoSaldo = cli_lineaCreditoSaldo;
	}
	

}
