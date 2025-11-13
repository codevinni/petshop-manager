package br.tsi.petshop.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import br.tsi.petshop.model.Appointment;
import br.tsi.petshop.model.Service;

public class AppointmentDAO extends DAO{

    public boolean add(Appointment appointment) {
    	
        String sqlAppointment = "INSERT INTO agendamento (client_id, dog_id, date, status) VALUES (?, ?, ?, ?) RETURNING id";
        String sqlServices = "INSERT INTO agendamento_servicos (agendamento_id, servico) VALUES (?, ?)";

        try (PreparedStatement stmt1 = connection.prepareStatement(sqlAppointment);
             PreparedStatement stmt2 = connection.prepareStatement(sqlServices)) {

            stmt1.setLong(1, appointment.getClientId());
            stmt1.setLong(2, appointment.getDogId());
            stmt1.setObject(3, appointment.getDate());
            stmt1.setString(4, appointment.getStatus());
            
            ResultSet rs = stmt1.executeQuery();

            if (rs.next()) {
            	
                long appointmentId = rs.getLong("id");

                for (Service s : appointment.getServices()) {
                    stmt2.setLong(1, appointmentId);
                    stmt2.setString(2, s.getName());
                    stmt2.addBatch();
                }
                
                stmt2.executeBatch();
            }

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    
    public boolean updateStatus(Long id, String newStatus) {
    	
        String sql = "UPDATE agendamento SET status = ? WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, newStatus);
            stmt.setLong(2, id);
            
            stmt.execute();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false;
    }
    
    
    public boolean isDateAvaliable(LocalDate date) {
    	return getListByDateRange(date, date).isEmpty();
    }
    
    public List<Appointment> getListByDateRange(LocalDate start, LocalDate end) {
    	
        List<Appointment> appointments = new ArrayList<>();

        String sql = "SELECT * FROM agendamento WHERE date BETWEEN ? AND ? ORDER BY date";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setObject(1, start);
            stmt.setObject(2, end);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	
                Appointment appointment = new Appointment();
                
                appointment.setId(rs.getLong("id"));
                appointment.setClientId(rs.getLong("client_id"));
                appointment.setDogId(rs.getLong("dog_id"));
                appointment.setDate(rs.getObject("date", LocalDate.class));
                appointment.setStatus(rs.getString("status"));

                appointment.setServices(getServicesByAppointment(rs.getLong("id")));

                appointments.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    private List<Service> getServicesByAppointment(Long appointmentId) {
        
    	List<Service> services = new ArrayList<>();
         
        String sql = """
                SELECT name, price FROM agendamento_servicos
                JOIN servicos ON name = servico
                WHERE agendamento_id = ?
            """;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        	
            stmt.setLong(1, appointmentId);
            
            ResultSet rs = stmt.executeQuery();

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
    
    
    public Appointment search(Long id) {
    	
        Appointment ap = null;

        String sql = "SELECT * FROM agendamento WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setLong(1, id);
            
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
            	
                ap = new Appointment()
                .setId(rs.getLong("id"))
                .setClientId(rs.getLong("client_id"))
                .setDogId(rs.getLong("dog_id"))
                .setDate(rs.getObject("date", java.time.LocalDate.class))
                .setStatus(rs.getString("status"))
                .setServices(getServicesByAppointment(id));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ap;
    }
    
    
    public List<Appointment> listAll() {
        List<Appointment> appointments = new ArrayList<>();

        String sql = "SELECT * FROM agendamento ORDER BY date ASC";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
        		
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
            	
                Appointment appointment = new Appointment();
                
                appointment.setId(rs.getLong("id"));
                appointment.setClientId(rs.getLong("client_id"));
                appointment.setDogId(rs.getLong("dog_id"));
                appointment.setDate(rs.getObject("date", LocalDate.class));
                appointment.setStatus(rs.getString("status"));

                appointment.setServices(getServicesByAppointment(rs.getLong("id")));

                appointments.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    
}
