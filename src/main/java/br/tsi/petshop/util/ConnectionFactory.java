package br.tsi.petshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public static Connection getConnection() {
		
		final String URL = "";
		
		try {			
			
			Class.forName("org.postgresql.Driver");
			return DriverManager.getConnection(URL);
			
		} catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		}
		
		return null;
	}
}
