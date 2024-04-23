package it.coinstellation.model.database;

import java.sql.Connection;

abstract class AbstractDAO {
	private final Connection connection;
	
	public AbstractDAO(Connection connection) {
		this.connection = connection;
	}
	
	protected final Connection getConnection() {
		return connection;
	}
}
