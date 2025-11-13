package br.tsi.petshop.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import br.tsi.petshop.model.Client;

public class ClientDAO extends DAO {

	/**
	 * Add a new client into the database.
	 * 
	 * @param client client object model to insert
	 * @return true if success or false otherwise
	 */
	public boolean add(Client client) throws Exception{
	    
	    String sql = "INSERT INTO clientes (name, cpf, email, number, birth) "
	               + "VALUES (?, ?, ?, ?, ?)";
	    
	    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
	        
	        stmt.setString(1, client.getName());
	        stmt.setString(2, client.getCpf());
	        stmt.setString(3, client.getEmail());
	        stmt.setString(4, client.getNumber());
	        stmt.setObject(5, client.getBirth());
	        
	        stmt.execute();
	        return true;
   
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return false;
	}
	
	public Client search(String cpf) {
        return search("cpf", cpf);
    }

    public Client search(Long id) {
    	 return search("id", id.toString());
    }
	
	private Client search(String field, String value) {
    	
        String sql = String.format("SELECT * FROM clientes WHERE %s = ?", field);
        Client client = null;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	
        	if(field.equals("cpf"))
        		stmt.setString(1, value);
        	else
        		stmt.setLong(1, Long.valueOf(value));
        	
            ResultSet rs = stmt.executeQuery();

            if(rs.next()) 
                client = new Client()
                    .setId(rs.getLong("id"))
                    .setName(rs.getString("name"))
                    .setCpf(rs.getString("cpf"))
                    .setEmail(rs.getString("email"))
                    .setNumber(rs.getString("number"))
                    .setBirth(rs.getObject("birth", LocalDate.class));
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return client;
    }
	
	/**
	 * Return a relation of clients in database.
	 * 
	 * @return client List
	 */
	public List<Client> clientsList(){
		
		List<Client> clients = new ArrayList<>();
		String sql = "SELECT * FROM clientes";
		
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
		    
		    ResultSet rs = stmt.executeQuery();
		    
		    while (rs.next()) {
		    	
		        Client c = new Client();
		        
		        c.setId(rs.getLong("id"))
		         .setName(rs.getString("name"))
		         .setCpf(rs.getString("cpf"))
		         .setEmail(rs.getString("email"))
		         .setNumber(rs.getString("number"))
		         .setBirth(rs.getObject("birth", LocalDate.class));
		        
		        clients.add(c);
		    }
		    
		} catch (SQLException e) {
		    e.printStackTrace();
		}

		return clients;
	}
	
}
