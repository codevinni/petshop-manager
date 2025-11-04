<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
<!DOCTYPE html>

<html data-theme="light">

	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Bulma CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
		<link rel="stylesheet" type="text/css" href="css/sidebar.css">
	</head>

	<body>
		
		<aside class="menu column is-one-quarter ps-sidebar">
            <p class="menu-label">CLIENTES E SERVIÇOS</p>
            <ul class="menu-list">
                <li><a class="${param.activePage == 'caes' ? 'is-active' : ''}">Cães</a></li>
                <li><a class="${param.activePage == 'clientes' ? 'is-active' : ''}">Clientes</a></li>
                <li><a class="${param.activePage == 'servicos' ? 'is-active' : ''}">Serviços</a></li>
            </ul>

            <p class="menu-label">AGENDAMENTOS</p>
            <ul class="menu-list">
                <li><a class="${param.activePage == 'novo-agendamento' ? 'is-active' : ''}">Novo agendamento</a></li>
                <li><a class="${param.activePage == 'agendamentos-pendentes' ? 'is-active' : ''}">Agendamentos pendentes</a></li>
                <li><a class="${param.activePage == 'lancamento' ? 'is-active' : ''}">Lançamento</a></li>
                <li><a class="${param.activePage == 'relatorio' ? 'is-active' : ''}">Relatório</a></li>
            </ul>
        </aside>
        
	</body>
	
</html>