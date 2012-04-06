package com.gfive.dao;

import java.util.List;

import com.gfive.domain.Asiento;

public interface AsientoDao {
	
	public Asiento getAsiento(int numAsiento) throws Exception;
	
	public Asiento getAsiento(String referencia) throws Exception;
	
	public Asiento generarAsiento(Asiento asiento);
	
	public void eliminarAsiento(String referencia);
	
	public List<Asiento> getAsientos();

}
