package br.tsi.petshop.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.tsi.petshop.model.Admin;

public class AdminDAO extends DAO {

	public Admin checkCredentials(String username, String password) {
		
		String sql = "SELECT * FROM admin WHERE username=? and password=?";
		
		Admin admin = null;
		
		try (PreparedStatement stmt = connection.prepareStatement(sql)){
			
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				admin = new Admin()
						.setUsername(rs.getString("username"))
						.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
		
		}
		
		return admin;
	}
	
}
