package br.tsi.petshop.controller.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import br.tsi.petshop.dao.AppointmentDAO;
import br.tsi.petshop.dao.ClientDAO;
import br.tsi.petshop.dao.DogDAO;
import br.tsi.petshop.dao.ServiceDAO;
import br.tsi.petshop.model.Appointment;
import br.tsi.petshop.model.Client;
import br.tsi.petshop.model.Dog;
import br.tsi.petshop.model.Service;
import br.tsi.petshop.util.Validator;
import br.tsi.petshop.util.exceptions.ValidationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddAppointmentAction implements Action {

    @Override
    public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    	try {
	        Long dogId = Long.parseLong(req.getParameter("dogId"));
	        LocalDate date = LocalDate.parse(req.getParameter("date"));
	        String[] selectedServices = req.getParameterValues("services");
	
	        Validator.dateAfterToday(date, "Data do Agendamento");
	        
	        DogDAO dogDAO = new DogDAO();
	        Dog dog = dogDAO.search(dogId);
	
	        if(dog == null) {
	        	req.setAttribute("erro", "Erro: Nenhum cão com este ID cadastrado");
	        }
	        else {
	        	
		        ClientDAO clientDAO = new ClientDAO();
		        Client client = clientDAO.search(dog.getOwnerId());
		
		        boolean available = new AppointmentDAO().isDateAvaliable(date);
		
		        if(available) {
		        	
		        	List<Service> services = new ArrayList<>();
		        	ServiceDAO serviceDAO = new ServiceDAO();
		        	
		        	if (selectedServices != null) {
		        		for (String serviceName : selectedServices) {
		        			Service s = serviceDAO.search(serviceName);
		        			if (s != null) 
		        				services.add(s);
		        		}
		        	}
		        	
		        	Appointment appointment = new Appointment();
		        	appointment.setClientId(client.getId());
		        	appointment.setDogId(dog.getId());
		        	appointment.setDate(date);
		        	appointment.setServices(services);
		        	appointment.setStatus("Pendente");
		        	
		        	if(new AppointmentDAO().add(appointment))
		        		return "views/appointments.jsp";
		        	
		        }
		        else {
		        	req.setAttribute("erro", "Erro: Data indisponível");
		        }
	        }
    	}catch (ValidationException validationException) {
    		req.setAttribute("erro", validationException.getMessage());
    		
		}catch (Exception e) {
			req.setAttribute("erro", "Ocorreu um erro");
		}
    		
    	return "views/new-appointment.jsp";
    }
}
