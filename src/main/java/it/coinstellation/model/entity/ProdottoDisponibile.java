package it.coinstellation.model.entity;

public final class ProdottoDisponibile extends Prodotto {
	private final long prezzo;
	
	public ProdottoDisponibile(int id, String nome, Tipo tipo, long valoreNominale, String anno, String nazione,
			String descrizione, boolean disponibile, long prezzo) {
		super(id, nome, tipo, valoreNominale, anno, nazione, descrizione, disponibile);
		this.prezzo = prezzo;
	}

	public long getPrezzo() {
		return prezzo;
	}
}
