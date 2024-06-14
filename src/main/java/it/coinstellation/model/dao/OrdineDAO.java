package it.coinstellation.model.dao;

import it.coinstellation.model.entity.Ordine;
import it.coinstellation.model.entity.ProdottoDisponibile;

import java.lang.Integer;
import java.util.List;
import java.util.Map;


public interface OrdineDAO {

	/** Operazioni di aggiornamento **/

	/**
	 *	Memorizza il nuovo ordine.
	 *
	 *	@throws NullPointerException se {@code ordine} oppure {@code prodotti} è {@code null}
	 *	@throws IllegalArgumentException se {@code prodotti} è vuoto oppure contiene qualche valore non positivo
	 */
	void insertOrdine(Ordine ordine, Map<Integer, Integer> prodotti);
}
