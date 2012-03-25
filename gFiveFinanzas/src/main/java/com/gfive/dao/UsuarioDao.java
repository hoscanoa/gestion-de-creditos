package com.gfive.dao;

import com.gfive.domain.Usuario;

public interface UsuarioDao {
	
	public Usuario getUsuario(String nombre, String password) throws Exception;

}
