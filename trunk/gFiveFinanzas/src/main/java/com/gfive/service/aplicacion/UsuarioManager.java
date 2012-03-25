package com.gfive.service.aplicacion;

import java.io.Serializable;
import com.gfive.domain.Usuario;

public interface UsuarioManager extends Serializable{
	
	public Usuario login(String nombreUsuario, String password);
}
