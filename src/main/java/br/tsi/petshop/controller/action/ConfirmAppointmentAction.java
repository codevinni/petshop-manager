package br.tsi.petshop.controller.action;

import java.io.IOException;
import java.time.LocalDate;

import br.tsi.petshop.dao.AppointmentDAO;
import br.tsi.petshop.dao.ServiceProvisionDAO;
import br.tsi.petshop.model.Appointment;
import br.tsi.petshop.model.Service;
import br.tsi.petshop.model.ServiceProvision;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ConfirmAppointmentAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			
            Long appointmentId = Long.parseLong(req.getParameter("id"));
            LocalDate completionDate = LocalDate.parse(req.getParameter("date"));
            
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            Appointment appointment = appointmentDAO.search(appointmentId);

            if (appointment == null) {
                req.setAttribute("erro", "Erro: Agendamento não encontrado");
            }
            else {
            	
            	if(completionDate.isAfter(LocalDate.now())) 
            		req.setAttribute("erro", "Erro: A Data de Realização é inválida");
            	else {
            		
            		double total = 0;
            		
            		for(Service s : appointment.getServices()) 
            			total += s.getPrice();
            		
            		if (appointment.getServicesCount() >= 3) 
            			total *= 0.9;
            		
            		ServiceProvision sp = new ServiceProvision()
            				.setAppointmentId(appointmentId)
            				.setDate(completionDate)
            				.setTotalValue(total);
            		
            		new ServiceProvisionDAO().add(sp);
            		
            		appointmentDAO.updateStatus(appointmentId, "Concluído");
            		
            		return "views/resume.jsp";
            	}
            }
        } catch (Exception e) {
            req.setAttribute("erro", "Ocorreu um erro");
        }
		
		return "views/appointments.jsp";
	}
}
