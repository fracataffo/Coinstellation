package it.coinstellation.model.dao;

import it.coinstellation.model.entity.ProdottoDisponibile;

import java.util.List;

/**
 * Interfaccia di un oggetto DAO che consente di interagire
 * con il catalogo.
 */
public interface ProdottoDAO {

	/** Query **/
	
	/**
	 * Estrae i prodotti che formano il catalogo.
	 */
	List<ProdottoDisponibile> queryProdottiDisponibili();
	
	/**
	 * Estrae il prodotto specificato dal catalogo.
	 *
	 * @throws IllegalArgumentException se {@code prodottoID} non è positivo
	 */
	 Optional<ProdottoDisponibile> queryProdotto(int prodottoID);
}
