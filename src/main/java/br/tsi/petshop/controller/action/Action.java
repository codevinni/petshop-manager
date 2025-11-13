package br.tsi.petshop.controller.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
	public String service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}
