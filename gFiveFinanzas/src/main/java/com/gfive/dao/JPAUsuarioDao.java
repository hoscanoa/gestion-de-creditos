package com.gfive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gfive.domain.Usuario;

@Repository(value = "usuarioDao")
public class JPAUsuarioDao implements UsuarioDao {

	private EntityManager em = null;

	/*
	 * Sets the entity manager.
	 */
	@PersistenceContext
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public Usuario getUsuario(String nombre, String password) throws Exception {
		// Query query =
		// em.createNativeQuery("execute usp_comprobarUsuario'cesar','cesar','1','0',''");
		// query.setParameter(1, usuario.getUsuario());
		// query.setParameter(2, usuario.getContraseña());
		Query query = em
				.createQuery("select p from Usuario p where p.usuario = ? AND p.contraseña = ?");
		query.setParameter(1, nombre);
		query.setParameter(2, password);
		List<Usuario> usuarios = query.getResultList();
		if (usuarios.size() != 1) {
			throw new Exception("usuario no encontrado");
		} else {
			return usuarios.get(0);

		}

	}
}
