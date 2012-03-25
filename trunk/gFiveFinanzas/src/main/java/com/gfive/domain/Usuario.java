package com.gfive.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tusuario")
public class Usuario implements Serializable{

	//TODO 1: modificar y adaptar a BD (en especial por atributo "usuario")

	
	private static final long serialVersionUID = 1L;
	
	@Id
	private int idUsuario;
	
	private int idPersonal;
	private int idPerfilUsuario;
	private String usuario;
	private String contraseña;
	private int intentos;
	private String estado;
	
	
	public int getIdPersonal() {
		return idPersonal;
	}
	public void setIdPersonal(int idPersonal) {
		this.idPersonal = idPersonal;
	}
	
	public int getIntentos() {
		return intentos;
	}
	public void setIntentos(int intentos) {
		this.intentos = intentos;
	}
	
	public int getIdPerfilUsuario() {
		return idPerfilUsuario;
	}
	public void setIdPerfilUsuario(int idPerfilUsuario) {
		this.idPerfilUsuario = idPerfilUsuario;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getContraseña() {
		return contraseña;
	}
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

}
