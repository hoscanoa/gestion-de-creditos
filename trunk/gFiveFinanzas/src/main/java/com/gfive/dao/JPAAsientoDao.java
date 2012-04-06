package com.gfive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gfive.domain.Asiento;

@Repository(value = "asientoDao")
public class JPAAsientoDao implements AsientoDao {

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
	public Asiento getAsiento(int numAsiento) throws Exception{
		Query query = em
				.createQuery("select a from Asiento a where a.numAsiento = ?");
		query.setParameter(1, numAsiento);
		List<Asiento> asientos = query.getResultList();
		if (asientos.size() < 1) {
			return null;
		} else {
			if (asientos.size() > 1){
				throw new Exception("asiento duplicado en BD");
			} else {
				return asientos.get(0);
			}
		}
	}
	
	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public Asiento getAsiento(String referencia) throws Exception{
		Query query = em
				.createQuery("select a from Asiento a where a.referencia = ?");
		query.setParameter(1, referencia);
		List<Asiento> asientos = query.getResultList();
		if (asientos.size() < 1) {
			return null;
		} else {
			if (asientos.size() > 1){
				throw new Exception("asiento duplicado en BD");
			} else {
				return asientos.get(0);
			}
		}
	}

	@Transactional(readOnly = false)
	public Asiento generarAsiento(Asiento asiento) {
		return em.merge(asiento);
		
	}
	
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<Asiento> getAsientos() {
		return em.createQuery("select a from Asiento a order by a.numAsiento").getResultList();
	}
	
	@Transactional(readOnly = false)
	public void eliminarAsiento(String referencia) {
		Query query = em
				.createQuery("DELETE FROM Asiento a WHERE a.referencia = ?");
		query.setParameter(1, referencia).executeUpdate();
	}
	
}
