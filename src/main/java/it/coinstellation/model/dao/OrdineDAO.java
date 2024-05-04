package it.coinstellation.model.dao;

import it.coinstellation.model.entity.Ordine;

import java.lang.Integer;

import java.util.Map;


public interface OrdineDAO {

	/** Operazioni di aggiornamento **/

	/**
	 *	Memorizza il nuovo ordine.
	 *
	 *	@throws NullPointerException se {@code ordine} oppure {@code prodotti} è {@code null}
	 *	@throws IllegalArgumentException se {@code prodotti} è vuoto oppure contiene qualche valore non positivo
	 */
	List<ProdottoDisponibile> insertOrdine(Ordine ordine, Map<Integer, Integer> prodotti);
}
