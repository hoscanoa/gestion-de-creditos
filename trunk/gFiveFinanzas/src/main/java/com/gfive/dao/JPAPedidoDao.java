package com.gfive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gfive.domain.Pedido;

@Repository(value = "pedidoDao")
public class JPAPedidoDao implements PedidoDao {

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
	public Pedido getPedido(int idPedido) throws Exception{
		Query query = em
				.createQuery("select p from Pedido p where p.idPedido = ?");
		query.setParameter(1, idPedido);
		List<Pedido> pedidos = query.getResultList();
		if (pedidos.size() < 1) {
			return null;
		} else {
			if (pedidos.size() > 1){
				throw new Exception("pedido duplicado en BD");
			} else {
				return pedidos.get(0);
			}
		}
	}

	@Transactional(readOnly = false)
	public void grabarPedido(Pedido pedido) {
		em.merge(pedido);
		
	}

	@Transactional(readOnly = false)
	public void actualizarPedido(Pedido pedido) {
		Query query = em
				.createQuery("UPDATE Pedido p SET p.situacion = ? WHERE p.idPedido = ?");
		query.setParameter(1, pedido.getSituacion());
		query.setParameter(2, pedido.getIdPedido());
		query.executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Pedido> getPedidosAprobados() {
		return em.createQuery("select p from Pedido p where p.situacion = 'aprobado' order by p.idPedido").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Pedido> getPedidosObservados() {
		return em.createQuery("select p from Pedido p where p.situacion = 'observado' order by p.idPedido").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Pedido> getPedidosPendientes() {
		return em.createQuery("select p from Pedido p where p.situacion = 'pendiente' order by p.idPedido").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Pedido> getPedidosTodos() {
		return em.createQuery("select p from Pedido p order by p.idPedido").getResultList();
	}

	@Transactional(readOnly = false)
	public void eliminarPedido(Pedido pedido) {
		Query query = em
				.createQuery("DELETE FROM Pedido p WHERE p.idPedido = ?");
		query.setParameter(1, pedido.getIdPedido()).executeUpdate();
	}
}
