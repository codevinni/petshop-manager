package br.tsi.petshop.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import br.tsi.petshop.model.ServiceProvision;

public class ServiceProvisionDAO extends DAO {

	
	public boolean add(ServiceProvision sp) {
		 
		String sql = "INSERT INTO prestacao_servico (appointment_id, date, total_value) VALUES (?, ?, ?)";
		
		try (PreparedStatement stmt = connection.prepareStatement(sql)) {
			
		    stmt.setLong(1, sp.getAppointmentId());
		    stmt.setObject(2, sp.getDate());
		    stmt.setDouble(3, sp.getTotalValue());
		    
		    stmt.execute();
		    return true;
		    
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		
		return false;
	}

	public List<ServiceProvision> listByDateRange(String from, String to) {

        List<ServiceProvision> provisions = new ArrayList<>();
        
        String sql = "SELECT * FROM prestacao_servico WHERE date BETWEEN ? AND ? ORDER BY date DESC";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setObject(1, LocalDate.parse(from));
            stmt.setObject(2, LocalDate.parse(to));

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	
                ServiceProvision sp = new ServiceProvision();
                
                sp.setId(rs.getLong("id"));
                sp.setAppointmentId(rs.getLong("appointment_id"));
                sp.setDate(rs.getObject("date", LocalDate.class));
                sp.setTotalValue(rs.getDouble("total_value"));

                provisions.add(sp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return provisions;
    }
	
    public List<ServiceProvision> listAll() {
    	
        List<ServiceProvision> list = new ArrayList<>();
        
        String sql = "SELECT * FROM prestacao_servico ORDER BY date DESC";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
        		
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
            	
            	ServiceProvision sp = new ServiceProvision();
                
                sp.setId(rs.getLong("id"))
                .setAppointmentId(rs.getLong("appointment_id"))
                .setDate(rs.getObject("date", LocalDate.class))
                .setTotalValue(rs.getDouble("total_value"));
                
                list.add(sp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
