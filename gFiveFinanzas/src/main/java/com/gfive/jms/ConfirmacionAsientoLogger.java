package com.gfive.jms;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.gfive.domain.Asiento;

/**
 * A simple logger for reward confirmations.
 */
public class ConfirmacionAsientoLogger {

	private static final Log logger = LogFactory.getLog(ConfirmacionAsientoLogger.class);

	private List<Asiento> confirmations = new ArrayList<Asiento>();

	public void log(Asiento asiento) {
		this.confirmations.add(asiento);
		if (logger.isInfoEnabled()) {
			logger.info("recibida confirmación: " + asiento);
		}
	}

	public List<Asiento> getConfirmations() {
		return Collections.unmodifiableList(confirmations);
	}
}
