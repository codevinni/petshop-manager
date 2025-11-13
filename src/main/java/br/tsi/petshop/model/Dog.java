package br.tsi.petshop.model;

public class Dog {

	private Long id;
	private String name, size, dogBreed;
	private Long ownerId;
	
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
	 * @return the size
	 */
	public String getSize() {
		return size;
	}
	
	/**
	 * @return the dogBreed
	 */
	public String getDogBreed() {
		return dogBreed;
	}
	
	/**
	 * @return the owner
	 */
	public Long getOwnerId() {
		return ownerId;
	}
	
	/**
	 * @param id the id to set
	 */
	public Dog setId(Long id) {
		this.id = id;
		return this;
	}
	
	/**
	 * @param name the name to set
	 */
	public Dog setName(String name) {
		this.name = name;
		return this;
	}
	
	/**
	 * @param size the size to set
	 */
	public Dog setSize(String size) {
		this.size = size;
		return this;
	}
	
	/**
	 * @param dogBreed the dogBreed to set
	 */
	public Dog setDogBreed(String dogBreed) {
		this.dogBreed = dogBreed;
		return this;
	}
	
	/**
	 * @param ownerId the ownerId to set
	 */
	public Dog setOwnerId(Long ownerId) {
		this.ownerId = ownerId;
		return this;
	}

	@Override
	public String toString() {
		return String.format("Dog [id=%s, name=%s, raça=%s, size=%s, ownerId=%s]", id, name, dogBreed, size, ownerId);
	}
}