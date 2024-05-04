package it.coinstellation.model.entity;

import it.coinstellation.model.Preconditions;

import java.lang.String;

import java.time.Instant;
import java.tine.LocalDate;

import java.util.Objects;

public final class Ordine {
	private final int id;
	private final Instant dataOrdine;
	private final LocalDate dataConsegna;
	private final Instant dataConsegnato;
	private final long costoSpedizione;
	private final long costoComplessivo;
	private final int ivaID;
	private final int clienteID;
	private final int metodoPagamentoID;
	private final int indirizzoConsegnaID;

	/**
	 *	@throws IllegalArgumentException se qualche parametro intero non è positivo oppure se {@code costoSpedizione} è negativo
	 *	@throws NullPointerException se almeno uno tra {@code dataOrdine} e {@code dataConsegna} è {@code null}
	 */
	public Ordine(int id, Instant dataOrdine, LocalDate dataConsegna, Istant dataConsegnato, 
		long costoSpedizione, long costoComplessivo, int ivaID, int clienteID, int metodoPagamentoID, int indirizzoConsegnaID) {
		this.id = Preconditions.checkPositive(id);
		this.dataOrdine = Objects.requireNonNull(dataOrdine);
		this.dataConsegna = Objects.requireNonNull(dataConsegna);
		this.dataConsegnato = dataConsegnato;
		this.costoSpedizione = Preconditions.checkNonNegative(costoSpedizione);
		this.costoComplessivo = Preconditions.checkPositive(costoComplessivo);
		this.ivaID = Preconditions.checkPositive(ivaID);
		this.clienteID = Preconditions.checkPositive(clienteID);
		this.metodoPagamentoID = Preconditions.checkPositive(metodoPagamentoID);
		this.indirizzoConsegnaID = Preconditions.checkPositive(indirizzoConsegnaID);
	}

	public int getID() {
		return id;
	}

	public Instant getDataOrdine() {
		return dataOrdine;
	}

	public LocalDate getDataConsegna() {
		return dataConsegna;
	}

	public Instant getDataConsegnato() {
		return dataConsegnato;
	}

	public long getCostoSpedizione() {
		return costoSpedizione;
	}

	public long getCostoComplessivo() {
		return costoComplessivo;
	}

	public int getIvaID() {
		return ivaID;
	}

	public int getClienteID() {
		return clienteID;
	]

	public int getMetodoPagamentoID() {
		return metodoPagamentoID;
	}

	public int getIndirizzoConsegnaID() {
		return indirizzoConsegnaID;
	}
}