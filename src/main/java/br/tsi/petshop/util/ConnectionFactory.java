package br.tsi.petshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public static Connection getConnection() {
		
		final String URL = "jdbc:postgresql://localhost/petshop",
			  USER = "postgres",
			  PASS = "admin";
		
		try {			
			
			Class.forName("org.postgresql.Driver");
			return DriverManager.getConnection(URL, USER, PASS);
			
		} catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		}
		
		return null;
	}
}
