package br.tsi.petshop.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ServiceProvision {

	private Long id;
    private Long appointmentId;
    private LocalDate date;
    private Double totalValue;
    
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * @return the appointmentId
	 */
	public Long getAppointmentId() {
		return appointmentId;
	}
	
	/**
	 * @return the date
	 */
	public LocalDate getDate() {
		return date;
	}
	
	/**
	 * @return the totalValue
	 */
	public Double getTotalValue() {
		return totalValue;
	}
	
	/**
	 * @param id the id to set
	 */
	public ServiceProvision setId(Long id) {
		this.id = id;
		return this;
	}
	
	/**
	 * @param appointmentId the appointmentId to set
	 */
	public ServiceProvision setAppointmentId(Long appointmentId) {
		this.appointmentId = appointmentId;
		return this;
	}
	
	/**
	 * @param date the date to set
	 */
	public ServiceProvision setDate(LocalDate date) {
		this.date = date;
		return this;
	}
	
	/**
	 * @param totalValue the totalValue to set
	 */
	public ServiceProvision setTotalValue(Double totalValue) {
		this.totalValue = totalValue;
		return this;
	}

	public String getDateFormatted() {
	    return date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	}
	
	@Override
	public String toString() {
		return String.format("ServiceProvision [id=%s, appointmentId=%s, date=%s, totalValue=%s]", id, appointmentId,
				date, totalValue);
	}
    
}
