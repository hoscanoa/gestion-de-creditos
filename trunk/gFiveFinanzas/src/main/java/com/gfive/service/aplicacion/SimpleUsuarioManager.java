package com.gfive.service.aplicacion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.gfive.dao.UsuarioDao;
import com.gfive.domain.Usuario;

@Component
@Service("usuarioManager")
public class SimpleUsuarioManager implements UsuarioManager {
	
	@Autowired
	private UsuarioDao usuarioDao;

	public void setUsuarioDao(UsuarioDao usuarioDao) {
		this.usuarioDao = usuarioDao;
	}

	private Usuario usuario;
	
	public Usuario login(String nombreUsuario, String password){
		try {
			return usuarioDao.getUsuario(nombreUsuario, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usuario;
	}

}
