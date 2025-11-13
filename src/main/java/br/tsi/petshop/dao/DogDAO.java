package br.tsi.petshop.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.tsi.petshop.model.Dog;

public class DogDAO extends DAO {

	/**
	 * Add a new dog into the database.
	 * 
	 * @param dog dog object model to insert
	 * @return true if success or false otherwise
	 */
	public boolean add(Dog dog) {
		
		String sql = "INSERT INTO caes (name, size, dog_breed, owner_id) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, dog.getName());
            stmt.setString(2, dog.getSize());
            stmt.setString(3, dog.getDogBreed());
            stmt.setLong(4, dog.getOwnerId());

            stmt.execute();
            return true;
     
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

	public Dog search(Long id) {
	    
	    String sql = "SELECT * FROM caes WHERE id = ?";
	    Dog dog = null;

	    try (PreparedStatement stmt = connection.prepareStatement(sql)) {

	        stmt.setDouble(1, id);
	        
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            dog = new Dog()
	                .setId(rs.getLong("id"))
	                .setName(rs.getString("name"))
	                .setSize(rs.getString("size"))
	                .setOwnerId(rs.getLong("owner_id")).setDogBreed(rs.getString("dog_breed"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return dog;
	}
	
	
	/**
	 * Return a relation of dogs in database.
	 * 
	 * @param filter clause
	 * @return dogs List
	 */
    public List<Dog> dogsList(String filter) {
    	
        List<Dog> dogs = new ArrayList<>();
        String sql = "SELECT * FROM caes" + filter;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
             
        	ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	
                Dog d = new Dog();
                
                d.setId(rs.getLong("id"))
                 .setName(rs.getString("name"))
                 .setSize(rs.getString("size"))
                 .setDogBreed(rs.getString("dog_breed"))
                 .setOwnerId(rs.getLong("owner_id"));

                dogs.add(d);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dogs;
    }
    
    /**
     * Return a relation of all dogs in database.
     * 
     * @return dogs List
     */
    public List<Dog> dogsList() {
    	return dogsList("");
    }
    
    /**
     * Return a relation of all dogs of a specified owner in database.
     * 
     * @param ownerId id of owner
     * @return dogs List
     */
    public List<Dog> dogsList(Long ownerId) {
    	return dogsList(String.format(" WHERE owner_id = %s", ownerId));
    }
    
}
