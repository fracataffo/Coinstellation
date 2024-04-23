package it.coinstellation.model;

import java.sql.SQLException;

public final class JDBCUtils {
	private JDBCUtils() {
		throw new UnsupportedOperationException("La classe non può essere istanziata");
	}
	
	public static void printException(SQLException e) {
		e.printStackTrace(System.err);
		
		System.err.println("SQLState: " + e.getSQLState());
		System.err.println("Error Code: " + e.getErrorCode());
        System.err.println("Message: " + e.getMessage());
	}
}
