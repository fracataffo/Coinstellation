package it.coinstellation.model.database;

import it.coinstellation.model.JDBCUtils;

import it.coinstellation.model.dao.ProdottoDAO;

import it.coinstellation.model.entity.Prodotto;
import it.coinstellation.model.entity.ProdottoDisponibile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

final class ProdottoDAO_Impl extends AbstractDAO implements ProdottoDAO {
	
	public ProdottoDAO_Impl(Connection connection) {
		super(connection);
	}

	@Override
	public List<ProdottoDisponibile> queryCatalogo() {
		String sql = "SELECT * FROM Prodotti WHERE disponibile = TRUE;";
		
		List<ProdottoDisponibile> prodotti = new ArrayList<>();
		try (PreparedStatement stmt = getConnection().prepareStatement(sql);
			ResultSet rs = stmt.executeQuery()) {
			
			while(rs.next()) {
				prodotti.add(
					new ProdottoDisponibile(
						rs.getInt("id"),
						rs.getString("nome"),
						Prodotto.Tipo.valueOf(rs.getString("tipo").toUpperCase()),
						rs.getLong("valore_nominale"),
						rs.getString("anno"),
						rs.getString("nazione"),
						rs.getString("descrizione"),
						rs.getBoolean("disponibile"),
						rs.getLong("prezzo")
					)
				);
			}
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}
		
		return prodotti;
	}

	@Override
	public synchronized List<ProdottoDisponibile> queryProdotti(Collection<Integer> prodottiID) {
		String sql = "SELECT * FROM Prodotti WHERE disponibile = TRUE AND id = ?;";
		
		List<ProdottoDisponibile> prodotti = new ArrayList<>();
		try (PreparedStatement stmt = getConnection().prepareStatement(sql)) {
			getConnection().setAutoCommit(false);

			for (Integer prodottoID: prodottiID) {
				stmt.setInt(1, prodottoID);

				try (ResultSet rs = stmt.executeQuery()) {
					if (rs.next()) {
						prodotti.add (
							new ProdottoDisponibile (
								rs.getInt("id"),
								rs.getString("nome"),
								Prodotto.Tipo.valueOf(rs.getString("tipo").toUpperCase()),
								rs.getLong("valore_nominale"),
								rs.getString("anno"),
								rs.getString("nazione"),
								rs.getString("descrizione"),
								rs.getBoolean("disponibile"),
								rs.getLong("prezzo")
							)
						);
					}
				}
			}

			getConnection().setAutoCommit(true);
		} catch (SQLException e) {
			JDBCUtils.printException(e);
		}
		
		return prodotti;
	}
}
