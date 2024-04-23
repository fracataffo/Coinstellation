package it.coinstellation.model.dao;

import it.coinstellation.model.entity.ProdottoDisponibile;

import java.util.List;

public interface CarrelloDAO {

	/** Operazioni di Aggiornamento **/
	
	/**
	 * Inserisce un prodotto nel carrello.
	 */
	void insertCarrello(int clienteID, int prodottoID, int unita);
	
	/**
	 * Modifica il numero di unità di un prodotto nel carrello.
	 */
	void updateCarrello(int clienteID, int prodottoID, int unita);
}
