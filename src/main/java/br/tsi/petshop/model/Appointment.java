package br.tsi.petshop.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class Appointment {

	private Long id;
	private Long clientId;
	private Long dogId;
	private List<Service> services;
	private LocalDate date;
	private String status;
	
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * @return the clientId
	 */
	public Long getClientId() {
		return clientId;
	}
	
	/**
	 * @return the dogId
	 */
	public Long getDogId() {
		return dogId;
	}
	
	/**
	 * @return the services
	 */
	public List<Service> getServices() {
		return services;
	}
	
	/**
	 * @return the date
	 */
	public LocalDate getDate() {
		return date;
	}
	
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	
	/**
	 * @param id the id to set
	 */
	public Appointment setId(Long id) {
		this.id = id;
		return this;
	}
	
	/**
	 * @param clientId the clientId to set
	 */
	public Appointment setClientId(Long clientId) {
		this.clientId = clientId;
		return this;
	}
	
	/**
	 * @param dogId the dogId to set
	 */
	public Appointment setDogId(Long dogId) {
		this.dogId = dogId;
		return this;
	}
	
	/**
	 * @param services the services to set
	 */
	public Appointment setServices(List<Service> services) {
		this.services = services;
		return this;
	}
	
	/**
	 * @param date the date to set
	 */
	public Appointment setDate(LocalDate date) {
		this.date = date;
		return this;
	}
	
	/**
	 * @param status the status to set
	 */
	public Appointment setStatus(String status) {
		this.status = status;
		return this;
	}
	
	public boolean isCancelable() {
		
	    if (date == null) 
	    	return false;
	    
	    return date.isAfter(LocalDate.now().plusDays(1));
	}
	
	public String getDateFormatted() {
	    return date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	}
	
	public int getServicesCount() {
		return services.size();
	}
	
	@Override
	public String toString() {
		return String.format("Appointment [id=%s, clientId=%s, dogId=%s, services=%s, date=%s, status=%s]", id,
				clientId, dogId, services, date, status);
	}
	
}
