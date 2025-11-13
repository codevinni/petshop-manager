package br.tsi.petshop.controller.action;

import java.io.IOException;

import br.tsi.petshop.dao.AppointmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CancelAppointmentAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Long id = Long.parseLong(req.getParameter("id"));
         
         AppointmentDAO dao = new AppointmentDAO();
         dao.updateStatus(id, "Cancelado");
         
         return "views/appointments.jsp";
	}

}
