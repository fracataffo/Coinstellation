package it.coinstellation.model.database;

import it.coinstellation.model.dao.CarrelloDAO;
import it.coinstellation.model.dao.ProdottoDAO;

import java.sql.Connection;

import java.util.Objects;

import javax.naming.Context;
import javax.naming.InitialContext;

import javax.sql.DataSource;

/**
 * Classe che consente di interagire con il database per
 * mezzo degli oggetti DAO.
 */
// Classe realizzata applicando il Singleton Pattern.
public final class Database {
	private static final Database INSTANCE = new Database();
	private static boolean INSTANCE_CREATED = false;
	
	private final Connection connection;
	private ProdottoDAO prodottoDAO = null;
	private CarrelloDAO carrelloDAO = null;
	private OrdineDAO ordineDAO = null;
	
	private Database() {
		if (INSTANCE_CREATED) {
			throw new IllegalStateException("La classe Database può essere istanziata solo una volta");
		}
		
		try {
			// Caricamento del driver.
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			// Crea la connessione con il database.
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/CoinstellationDB");
			
			this.connection = Objects.requireNonNull(ds.getConnection());
			
		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
		
		INSTANCE_CREATED = true;
	}
	
	public static synchronized Database getInstance() {
		return INSTANCE;
	}

	public synchronized ProdottoDAO getProdottoDAO() {
		if(prodottoDAO == null) {
			prodottoDAO = new ProdottoDAO_Impl(connection);
		}
		
		return prodottoDAO;
	}
	
	public synchronized CarrelloDAO getCarrelloDAO() {
		if(carrelloDAO == null) {
			carrelloDAO = new CarrelloDAO_Impl(connection);
		}
		
		return carrelloDAO;
	}
	
	public synchronized OrdineDAO getOrdineDAO() {
		if(ordineDAO == null) {
			ordineDAO = new OrdineDAO_Impl(connection);
		}
		
		return ordineDAO;
	}
}
