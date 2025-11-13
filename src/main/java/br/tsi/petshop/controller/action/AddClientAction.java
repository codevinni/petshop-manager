package br.tsi.petshop.controller.action;

import java.io.IOException;
import java.time.LocalDate;

import org.postgresql.util.PSQLException;

import br.tsi.petshop.dao.ClientDAO;
import br.tsi.petshop.model.Client;
import br.tsi.petshop.util.Validator;
import br.tsi.petshop.util.exceptions.ValidationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddClientAction implements Action{
	
	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			
			String cpf = req.getParameter("cpf");
			String email = req.getParameter("email");
			LocalDate birth = LocalDate.parse(req.getParameter("birth"));
			
			Validator.validateCpf(cpf);
			Validator.dateBeforeToday(birth, "Data de Nascimento");
			
			Client client = new Client()
			        .setName(req.getParameter("name"))
			        .setCpf(cpf)
			        .setEmail(email)
			        .setNumber(req.getParameter("number"))
			        .setBirth(birth);

			if(new ClientDAO().add(client))
				return "views/clients.jsp";
			else
				req.setAttribute("erro", "Erro ao cadastrar cliente");
			
		} catch (ValidationException validationException) {
			req.setAttribute("erro", validationException.getMessage());
			
		} catch (Exception exception) {
			req.setAttribute("erro", "Ocorreu um erro");
		}
		
		return "registers/client-register.jsp";
	}
	
}