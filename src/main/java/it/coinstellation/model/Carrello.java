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
	/**
	 * Map che utilizza come chiavi il valore del campo {@code id} di ciascun 
	 * prodotto, e come valori il numero di unità.
	 */
	private final Map<Integer, Integer> prodotti = new HashMap<>();

	/**
	 *  Aggiunge nel carrello un'unità del prodotto specificato.
	 */
	public synchronized void addProdotto(int prodottoID) {
		checkParametri(prodottoID);

		int unita = prodotti.getOrDefault(prodottoID, 0);

		prodotti.put(prodottoID, unita + 1);
	}
	
	/**
	 *  Aggiunge nel carrello una quantità pari a {@code unit} del prodotto specificato.
	 *
	 *	@throws IllegalArgumentException se {@code unita} è minore di 2.
	 */
	public synchronized void addMultipleProdotto(int prodottoID, int unita) {
		checkParametri(prodottoID);
		if(unita < 2) {
			throw new IllegalArgumentException("Il valore del parametro unità è "+unita);
		}

		int oldUnita = prodotti.getOrDefault(prodottoID, 0);

		prodotti.put(prodottoID, oldUnita + unita);
	}

	/**
	 *  Rimuove dal carrello un'unità del prodotto specificato.
	 */
	public synchronized void removeProdotto(int prodottoID) {
		checkParametri(prodottoID);

		int unita = prodotti.getOrDefault(prodottoID, 0);

		if (unita > 1) {
			prodotti.put(prodottoID, unita - 1);
		} else if (unita == 1) {
			prodotti.remove(prodottoID);
		}
	}

	/**
	 *  Rimuove dal carrello tutte le unità del prodotto specificato.
	 */
	public synchronized void removeAllProdotto(int prodottoID) {
		checkParametri(prodottoID);

		prodotti.remove(prodottoID);
	}
	
	/**
	 *	Svuota il carrello.
	 */
	public synchronized void clear() {
		prodotti.clear();
	}

	/**
	 * Restituisce il numero di unità del prodotto specificato presenti nel carrello.
	 */
	public synchronized int getUnitaProdotto(int prodottoID) {
		checkParametri(prodottoID, 1);

		return prodotti.getOrDefault(prodottoID, 0);
	}

	/**
	 * Restituisce il valore del campo {@code id} dei prodotti presenti 
	 * nel carrello e per ciascuno di essi il numero di unità richiesto.
	 *
	 * Nota bene: La struttura restituita è immutabile.
	 * Non è possibile aggiungere o rimuovere prodotti in essa.
	 * Inoltre non si aggiorna se il carrello viene modificato.
	 */
	public synchronized Map<Integer, Integer> getProdotti() {
		return Map.copyOf(prodotti);
	}

	/**
	 * Controlla il parametro passato.
	 *
	 * @throws IllegalStateException se il parametro è negativo.
	 */
	private void checkParametri(int prodottoID) {
		checkParametri(prodottoID, 1);
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
