package br.tsi.petshop.controller.action;

import java.io.IOException;

import br.tsi.petshop.dao.ServiceDAO;
import br.tsi.petshop.model.Service;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddServiceAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			
			Service service = new Service()
		            .setName(req.getParameter("name"))
		            .setPrice(Double.valueOf(req.getParameter("price")));

			if(new ServiceDAO().add(service))
				return "views/services.jsp";
			else
				req.setAttribute("erro", "Erro: Esse serviço já foi cadastrado");
			
		} catch (NumberFormatException formatException) {
			req.setAttribute("erro", "Erro: Insira um preço válido");
			
		} catch (Exception e) {
			req.setAttribute("erro", "Ocorreu um erro");
		}
        
        return "registers/service-register.jsp";
	}
}
