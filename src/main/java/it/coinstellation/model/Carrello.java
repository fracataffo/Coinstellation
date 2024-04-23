package it.coinstellation.model;

import java.util.Map;
import java.util.HashMap;

/**
 * Classe che rappresenta il carrello di un utente non registrato.
 *
 * Ciascun metodo lancia @{code IllegalArgumentException} se qualche parametro
 * non è positivo.
 */
public final class Carrello {
	private final Map<Integer, Integer> prodotti = new HashMap<>();

	/**
	 *  Aggiunge il prodotto specificato nel carrello.
	 **/
	public synchronized void addProdotto(int prodottoID, int unita) {
		checkParametri(prodottoID, unita);
		
		prodotti.put(prodottoID, unita);
	}

	/**
	 *  Aggiorna il numero di unità del prodotto specificato.
	 */
	public synchronized void updateProdotto(int prodottoID, int unita) {
		checkParametri(prodottoID, unita);
	
		prodotti.replace(prodottoID, unita);
	}

	/**
	 * Rimuove dal carrello il prodotto specificato, se presente.
	 */
	public synchronized void deleteProdotto(int prodottoID) {
		checkParametri(prodottoID, 1);
		
		prodotti.remove(prodottoID);
	}
	
	/**
	 * Controlla i parametri passati.
	 *
	 * @throws IllegalStateException se i parametri sono negativi.
	 */
	private void checkParametri(int prodottoID, int unita) {
		if (prodottoID <= 0 || unita <= 0) {
			throw new IllegalArgumentException("Gli argomenti passati non sono positivi: " + 
				"prodottoID="+prodottoID+" unità="+unita);
		}
	}
}
