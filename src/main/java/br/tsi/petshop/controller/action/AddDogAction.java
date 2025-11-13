package br.tsi.petshop.controller.action;

import java.io.IOException;

import br.tsi.petshop.dao.ClientDAO;
import br.tsi.petshop.dao.DogDAO;
import br.tsi.petshop.model.Client;
import br.tsi.petshop.model.Dog;
import br.tsi.petshop.util.Validator;
import br.tsi.petshop.util.exceptions.ValidationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddDogAction implements Action {

	@Override
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			
			String cpf = req.getParameter("cpf");
			Validator.validateCpf(cpf);
			
			Client owner = new ClientDAO().search(cpf);
			
			if(owner != null) {
				
				Dog dog = new Dog()
			            .setName(req.getParameter("name"))
			            .setSize(req.getParameter("size"))
			            .setDogBreed(req.getParameter("dogBreed"))
			            .setOwnerId(owner.getId());
				
				if(new DogDAO().add(dog))
					return "views/pets.jsp";
				else
					req.setAttribute("erro", "Erro ao cadastrar cão");
			}
			else
				req.setAttribute("erro", "Erro: Cliente não existe");
			
		} catch (ValidationException validationException) {
			req.setAttribute("erro", validationException.getMessage());
			
		} catch (Exception e) {
			req.setAttribute("erro", "Ocorreu um erro");
		}
		
        return "registers/dog-register.jsp";
	}

}
