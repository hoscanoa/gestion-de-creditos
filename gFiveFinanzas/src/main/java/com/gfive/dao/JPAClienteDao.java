package com.gfive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gfive.domain.Cliente;
import com.gfive.domain.Usuario;

@Repository(value = "clienteDao")
public class JPAClienteDao implements ClienteDao {

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
	public Cliente getCliente(String ruc) throws Exception {
		Query query = em
				.createQuery("select p from Cliente p where p.cli_ruc = ?");
		query.setParameter(1, ruc);
		List<Cliente> clientes = query.getResultList();
		if (clientes.size() != 1) {
			throw new Exception("cliente no encontrado");
		} else {
			return clientes.get(0);

		}
	}

	@Transactional(readOnly = false)
	public void grabarCliente(Cliente cliente) {
		em.merge(cliente);
	}

	@Transactional(readOnly = false)
	public void actualizarCliente(Cliente cliente) {
		Query query = em
				.createQuery("UPDATE Cliente c SET c.cli_lineaCreditoTotal = ? and c.cli_lineaCreditoSaldo= ? WHERE p.cli_ruc = ?");
		query.setParameter(1, cliente.getCli_lineaCreditoTotal());
		query.setParameter(1, cliente.getCli_lineaCreditoSaldo());
		query.setParameter(1, cliente.getCli_ruc());
		query.executeUpdate();

	}

	@Transactional(readOnly = false)
	public void eliminarCliente(Cliente cliente) {
		Query query = em
				.createQuery("DELETE FROM Cliente c WHERE c.cli_ruc = ?");
		query.setParameter(1, cliente.getCli_ruc()).executeUpdate();
	}
}
