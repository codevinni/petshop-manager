package br.tsi.petshop.model;

public class Service {
	
    private String name;
    private Double price;
    
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * @return the price
	 */
	public Double getPrice() {
		return price;
	}
	
	/**
	 * @param name the name to set
	 */
	public Service setName(String name) {
		this.name = name;
		return this;
	}
	
	/**
	 * @param price the price to set
	 */
	public Service setPrice(Double price) {
		this.price = price;
		return this;
	}

	@Override
	public String toString() {
		return String.format("Service [name=%s, price=%s]", name, price);
	}
}
