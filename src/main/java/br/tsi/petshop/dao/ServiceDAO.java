package br.tsi.petshop.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.tsi.petshop.model.Service;

public class ServiceDAO extends DAO {


	public boolean add(Service service) {
		
	    String sql = "INSERT INTO servicos (name, price) VALUES (?, ?)";
	
	    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
	
	        stmt.setString(1, service.getName());
	        stmt.setDouble(2, service.getPrice());
	        
	        stmt.execute();
	        return true;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return false;
	}
	
	
	public boolean updatePrice(String name, Double newPrice) {
		
	    String sql = "UPDATE servicos SET price = ? WHERE name = ?";
	
	    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
	
	        stmt.setDouble(1, newPrice);
	        stmt.setString(2, name);
	        
	        return stmt.executeUpdate() > 0;
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return false;
	}
	
	public Service search(String name) {
		
	    String sql = "SELECT * FROM servicos WHERE name = ?";
	    Service service = null;

	    try (PreparedStatement stmt = connection.prepareStatement(sql)) {

	        stmt.setString(1, name);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) 
	            service = new Service()
	                    .setName(rs.getString("name"))
	                    .setPrice(rs.getDouble("price"));
	            
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return service;
	}
	
	public List<Service> listAll() {
		
	    List<Service> services = new ArrayList<>();
	    String sql = "SELECT name, price FROM servicos ORDER BY name";
	
	    try (PreparedStatement stmt = connection.prepareStatement(sql);
	    		
	         ResultSet rs = stmt.executeQuery()) {
	
	        while (rs.next()) {
	        	
	            Service s = new Service()
	                .setName(rs.getString("name"))
	                .setPrice(rs.getDouble("price"));
	            
	            services.add(s);
	        }
	
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	
	    return services;
	}
}
