package br.tsi.petshop.util;

import java.time.LocalDate;

import br.tsi.petshop.util.exceptions.ValidationException;

public class Validator {

	public static void validateCpf(String cpf) throws ValidationException{
		
		cpf = cpf.replaceAll("[^0-9]", "");
        
        if (cpf.length() != 11) 
            throw new ValidationException("Erro: CPF deve conter exatamente 11 dígitos numéricos");
	}
	
	public static void dateBeforeToday(LocalDate date, String field) throws ValidationException {
		
	    if (date.isAfter(LocalDate.now()) || date.isEqual(LocalDate.now())) 
	        throw new ValidationException("Erro: A " + field + " deve ser anterior à data de hoje");
	}
	
	public static void dateAfterToday(LocalDate date, String field) throws ValidationException {
			
	    if (date.isBefore(LocalDate.now())) 
	        throw new ValidationException("Erro: A " + field + " deve ser após à data de hoje");
	}
	
	public static void validateEmail(String email) throws ValidationException {
		
		String msg = "Erro: Formato do email inválido";
		
	    if (email == null || email.trim().isEmpty()) 
	        throw new ValidationException(msg);
	    
	    if (!email.contains("@") || !email.contains(".")) 
	        throw new ValidationException(msg);
	   
	    if (email.indexOf("@") > email.lastIndexOf(".")) 
	        throw new ValidationException(msg);
	}
}
