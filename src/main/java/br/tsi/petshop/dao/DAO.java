package br.tsi.petshop.dao;

import java.sql.Connection;

import br.tsi.petshop.util.ConnectionFactory;

public class DAO {

	protected Connection connection;
	
	protected DAO() {
		this.connection = ConnectionFactory.getConnection();
	}
}
