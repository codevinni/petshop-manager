package br.tsi.petshop.controller.action;

import java.io.IOException;

import br.tsi.petshop.dao.ServiceDAO;
import br.tsi.petshop.model.Service;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditServiceAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("name");
		
		try {
		
			Double newPrice = Double.valueOf(req.getParameter("newprice"));
			
			if(new ServiceDAO().updatePrice(name, newPrice))
				return "views/services.jsp";
			else
				req.setAttribute("erro", "Erro ao modificar preço");
			
		} catch (NumberFormatException formatException) {
			req.setAttribute("erro", "Erro: Insira um preço válido");
			
		} catch (Exception e) {
			req.setAttribute("erro", "Ocorreu um erro");
		}
        
        return String.format("registers/service-edit.jsp?name=%s", name);
	}

}