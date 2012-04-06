package com.gfive.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Asiento")
public class Asiento implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer numAsiento;
	
	private String descripcion;
	private String referencia;
	private double montoCargo;
	private double montoAbono;
	private String cuentaCargo;
	private String cuentaAbono;
	private Date fechaCreacion;
	
	public int getNumAsiento() {
		return numAsiento;
	}
	public void setNumAsiento(int numAsiento) {
		this.numAsiento = numAsiento;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getReferencia() {
		return referencia;
	}
	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}
	public double getMontoCargo() {
		return montoCargo;
	}
	public void setMontoCargo(double montoCargo) {
		this.montoCargo = montoCargo;
	}
	public double getMontoAbono() {
		return montoAbono;
	}
	public void setMontoAbono(double montoAbono) {
		this.montoAbono = montoAbono;
	}
	public String getCuentaCargo() {
		return cuentaCargo;
	}
	public void setCuentaCargo(String cuentaCargo) {
		this.cuentaCargo = cuentaCargo;
	}
	public String getCuentaAbono() {
		return cuentaAbono;
	}
	public void setCuentaAbono(String cuentaAbono) {
		this.cuentaAbono = cuentaAbono;
	}
	public Date getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	
}
