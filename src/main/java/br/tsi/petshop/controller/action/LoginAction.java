package br.tsi.petshop.controller.action;

import java.io.IOException;

import br.tsi.petshop.dao.AdminDAO;
import br.tsi.petshop.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String user = req.getParameter("username");
		String pass = req.getParameter("password");
		
		String url = "login.jsp";
		
		AdminDAO adminDAO = new AdminDAO();
		
		Admin admin = adminDAO.checkCredentials(user, pass); 
		
		if(admin != null) {
		
			HttpSession session = req.getSession();
			
			session.setMaxInactiveInterval(10*60);
			session.setAttribute("status", true);
			session.setAttribute("name", user);
			
			url = "dashboard.jsp";
		}
		
		return url;
	}

}
