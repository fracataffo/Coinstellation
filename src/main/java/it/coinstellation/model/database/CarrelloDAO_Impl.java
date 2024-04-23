package it.coinstellation.model.database;

import it.coinstellation.model.JDBCUtils;

import it.coinstellation.model.dao.CarrelloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

final class CarrelloDAO_Impl extends AbstractDAO implements CarrelloDAO {
	
	public CarrelloDAO_Impl(Connection connection) {
		super(connection);
	}
	
	@Override
	public void insertCarrello(int clienteID, int prodottoID, int unita) {
		checkParametri(clienteID, prodottoID, unita);
	
		String sql = "INSERT INTO Carrello(cliente, prodotto, unità) VALUES (?, ?, ?);";
		
		try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
			stmt.setInt(1, clienteID);
			stmt.setInt(2, prodottoID);
			stmt.setInt(3, unita);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}
	}
	
	@Override
	public void updateCarrello(int clienteID, int prodottoID, int unita) {
		checkParametri(clienteID, prodottoID, unita);
	
		String sql = "UPDATE Carrello SET unità = ? WHERE cliente = ? AND prodotto = ?;";
		
		try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
			stmt.setInt(1, unita);
			stmt.setInt(2, clienteID);
			stmt.setInt(3, prodottoID);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}
	}
	
	private void checkParametri(int clienteID, int prodottoID, int unita) {
		if (clienteID <= 0 || prodottoID <= 0 || unita <= 0) {
			throw new IllegalArgumentException("Gli argomenti passati non sono positivi: clienteID="+clienteID+" prodottoID="+prodottoID+" unità="+unita);
		} 
	}
}
