package it.coinstellation.model.dao;

import it.coinstellation.model.entity.ProdottoDisponibile;

import java.util.List;

public interface ProdottoDAO {

	/** Query **/
	
	/**
	 * Estrae i prodotti che formano il catalogo.
	 */
	List<ProdottoDisponibile> queryProdottiDisponibili();
}
