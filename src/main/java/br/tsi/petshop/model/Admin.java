package br.tsi.petshop.model;

public class Admin {

	private String username, password;

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param username the username to set
	 */
	public Admin setUsername(String username) {
		this.username = username;
		return this;
	}

	/**
	 * @param password the password to set
	 */
	public Admin setPassword(String password) {
		this.password = password;
		return this;
	}
	
}
