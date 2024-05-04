package it.coinstellation.model.database;

import it.coinstellation.model.JDBCUtils;

import it.coinstellation.model.dao.OrdineDAO;

import it.coinstellation.model.JDBCUtils;

import java.lang.Integer;

import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

final class OrdineDAO_Impl extends AbstractDAO implements OrdineDAO {
	
	public OrdineDAO_Impl(Connection connection) {
		super(connection);
	}
	
	@Override
	public synchronized void insertOrdine(Ordine ordine, Map<Integer, Integer> prodotti) {
		Objects.requireNonNull(ordine);
		Objects.requireNonNull(prodotti);
		checkProdotti(prodotti);

		Connection conn = getConnection();

		try {
			conn.setAutoCommit(false);	// Inizio della transazione.
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}

		try {	// Operazioni della transazione.
			// FIXME: Inserire prima le tuple in Versione_Prodotto, poi l'Ordine ed infine in Composizione
			insertOrdine(ordine);
			insertProdotti(ordine.getID(), prodotti);

			conn.commit();	// Fine della transazione.
		} catch (SQLException e) {
			JDBCUtils.printException(e);

			try { 
				conn.rollback(); 
			}
			catch (SQLException e2) {
				JDBCUtils.printException(e2);
			}
		}

		try {
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}
	}

	private void checkProdotti(Map<Integer, Integer> prodotti) {
		if (prodotti.isEmpty()) {
			throw new IllegalArgumentException("Il carrello è vuoto");
		}
		
		// TODO: Controllare i valori.
	}

	private void insertOrdine(Ordine ordine) {
		String sql = "INSERT INTO Ordine(data_consegna, data_consegnato, costo_spedizione, " +
						"costo_complessivo, indirizzo_consegna, cliente, iva, metodo_pagamento) " +
						"VALUES (?, ?, ?, ?, ?, ?, ?, ?); ";
		
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setDate(1, Date.valueOf(ordine.getDataConsegna());
			stmt.setNull(2, Types.TIMESTAMP);
			stmt.setInt(3, ordine.getCostoSpedizione());
			stmt.setInt(4, 0L);
			stmt.setInt(5, 1);
			stmt.setInt(6, 1);
			stmt.setInt(7, 1);
			stmt.setInt(8, 1);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}
	}

	private void insertProdotti(int ordineID, Map<Integer, Integer> prodotti) {
		Connection conn = getConnection();

		String sqlQuery1 = "SELECT versione FROM Versione_Prodotto WHERE prodotto = ? AND prezzo = (SELECT prezzo FROM Prodotto WHERE prodotto = ?); ";
		String sqlQuery2 = "SELECT MAX(versione) FROM Versione_Prodotto WHERE prodotto = ?; ";

		String sqlInsert1 = "INSERT INTO Versione_Prodotto(prodotto, versione, prezzo) VALUES (?, ?, ?); ";
		String sqlInsert2 = "INSERT INTO Composizione(prodotto, versione, ordine, unita) VALUES (?, ?, ?, ?); ";

		String sqlUpdate = "UPDATE Ordine SET costo_complessivo = costo_spedizione + (SELECT ); ";

		for (Map.Entry<Integer, Integer> entry: prodotti.entrySet()) {
			int prodottoID = entry.getKey();
			int unita = entry.getValue();
			int versione = 1;

			/* Step 1: Memorizzazione (se non già presente) della versione di ciascun prodotto con il prezzo corrente */
			try (PreparedStatement stmtQuery1 = conn.prepareStatement(sqlQuery1);
				PreparedStatement stmtQuery2 = conn.prepareStatement(sqlQuery2)) {
				stmtQuery1.setInt(1, prodottoID);
				stmtQuery1.setInt(2, prodottoID);

				try (ResultSet rs1 = stmtQuery1.executeQuery()) {
					if (rs.next()) { // Esiste una versione del prodotto con il prezzo corrente.
						versione = rs1.getInt("versione");
					} else {
						try (ResultSet rs2 = stmtQuery2.executeQuery()) {
							if (rs.next()) { // Esiste una versione del prodotto ma con prezzo differente.
								versione = rs2.getInt("versione") + 1;
							}
						}

						// Inserisce la nuova versione del prodotto con il prezzo corrente.
						try (PreparedStatement stmtInsert1 = conn.prepareStatement(sqlInsert1)) {
							stmtInsert1.setInt(1, prodottoID);
							stmtInsert1.setInt(2, versione);
							stmtInsert1.setInt(3, prezzo);
							
							stmtInsert1.executeUpdate();
						}
					}
				}
			} catch (SQLException e) {
				JDBCUtils.printException(e);
			}

			/* Step 2: Associazione della versione corrente di ciascun prodotto con l'ordine */
			// FIXME: Inserire in batch le tuple nella relazione Composizione 
			try (PreparedStatement stmtInsert2 = conn.prepareStatement(sqlInsert2)) {
				stmtInsert1.setInt(1, prodottoID);
				stmtInsert1.setInt(2, versione);
				stmtInsert1.setInt(3, ordineID);
				stmtInsert1.setInt(4, unita);

				stmtInsert1.executeUpdate();
			}
		}

		/* Step 3: Aggiornamento del costo complessivo dell'ordine */
		try (PreparedStatement stmtInsert2 = conn.prepareStatement(sqlInsert2)) {
				stmtInsert1.setInt(1, ordineID);

				stmtInsert1.executeUpdate();
		}
	}

}
