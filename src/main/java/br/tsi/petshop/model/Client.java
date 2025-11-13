package br.tsi.petshop.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Client {

	private Long id;
	private String name, cpf, email, number;
	private LocalDate birth;
	
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * @return the cpf
	 */
	public String getCpf() {
		return cpf;
	}
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	
	/**
	 * @return the number
	 */
	public String getNumber() {
		return number;
	}
	
	/**
	 * @return the birth
	 */
	public LocalDate getBirth() {
		return birth;
	}
	
	/**
	 * @param id the id to set
	 */
	public Client setId(Long id) {
		this.id = id;
		return this;
	}
	
	/**
	 * @param name the name to set
	 */
	public Client setName(String name) {
		this.name = name;
		return this;
	}
	
	/**
	 * @param cpf the cpf to set
	 */
	public Client setCpf(String cpf) {
		this.cpf = cpf;
		return this;
	}
	
	/**
	 * @param email the email to set
	 */
	public Client setEmail(String email) {
		this.email = email;
		return this;
	}
	
	/**
	 * @param number the number to set
	 */
	public Client setNumber(String number) {
		this.number = number;
		return this;
	}
	
	/**
	 * @param birth the birth to set
	 */
	public Client setBirth(LocalDate birth) {
		this.birth = birth;
		return this;
	}

	public String getCpfFormatted() {
		
	    try {
	       
	        return String.format("%s.%s.%s-%s",
	                cpf.substring(0, 3), cpf.substring(3, 6),
	                cpf.substring(6, 9), cpf.substring(9));
	        
	    } catch (Exception e) {
	        return "Inválido";
	    }
	}
	
	public String getBirthFormatted() {
	    return birth.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	}
	
	
	
	@Override
	public String toString() {
		return String.format("Client [id=%s, name=%s, cpf=%s, email=%s, number=%s, birth=%s]", id, name, cpf, email, number,
				birth);
	}
}
