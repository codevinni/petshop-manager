package br.tsi.petshop.controller;

import java.io.IOException;

import br.tsi.petshop.controller.action.Action;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/controllersvlt")
public class ControllerServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String nomeClasse = "br.tsi.petshop.controller.action." + req.getParameter("action");
		String url = "dashboard.jsp";
		System.out.println(nomeClasse);
		try {
			
			Class<?> classe = Class.forName(nomeClasse);
			Action logica = (Action)classe.newInstance();
			
			url = logica.service(req, res);
			
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher(url).forward(req, res);
		
	}
	
}
