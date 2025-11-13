package br.tsi.petshop.controller.action;

import java.io.IOException;

import br.tsi.petshop.dao.AppointmentDAO;
import br.tsi.petshop.model.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CompleteAppointmentAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		Long id = Long.parseLong(req.getParameter("id"));
        Appointment appointment = new AppointmentDAO().search(id);

        if (appointment == null) {
            req.setAttribute("error", "Agendamento não encontrado.");
            return "views/appointments.jsp";
        }

        req.setAttribute("appointment", appointment);
        return "registers/service-provision.jsp";
	}

}
