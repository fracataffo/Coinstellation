package it.coinstellation.model.entity;

public abstract class Prodotto {
	private final int id;
	private final String nome;
	private final Tipo tipo;
	private final long valoreNominale;
	private final String anno;
	private final String nazione;
	private final String descrizione;
	private final boolean disponibile;
	
	public Prodotto(int id, String nome, Tipo tipo, long valoreNominale, String anno, String nazione,
			String descrizione, boolean disponibile) {
		this.id = id;
		this.nome = nome;
		this.tipo = tipo;
		this.valoreNominale = valoreNominale;
		this.anno = anno;
		this.nazione = nazione;
		this.descrizione = descrizione;
		this.disponibile = disponibile;
	}
	
	public static enum Tipo {
		BANCONOTA, MONETA
	}
	
	public int getId() {
		return id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public Tipo getTipo() {
		return tipo;
	}
	
	public long getValoreNominale() {
		return valoreNominale; 
	}
	
	public String getAnno(){
		return anno;
	}
	
	public String getNazione(){
		return nazione;
	}
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public boolean isDisponibile() {
		return disponibile;
	}
}
