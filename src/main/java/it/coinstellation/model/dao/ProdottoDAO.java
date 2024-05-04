package it.coinstellation.model.dao;

import it.coinstellation.model.entity.ProdottoDisponibile;

import java.util.Collection;
import java.util.List;


public interface ProdottoDAO {

	/** Query **/
	
	/**
	 * Estrae tutti i prodotti del catalogo.
	 */
	List<ProdottoDisponibile> queryCatalogo();
	
	/**
	 * Estrae i prodotti specificati dal catalogo.
	 *
	 * @throws IllegalArgumentException se {@code prodottiID} è vuoto.
	 */
	List<ProdottoDisponibile> queryProdotti(Collection<Integer> prodottiID);
}
