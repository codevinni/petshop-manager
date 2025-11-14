<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="/aut.jsp" %>

<!DOCTYPE html>
<html lang="pt-br" data-theme="light">

<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard - Cão Q Late</title>

    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard-layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/clients.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/views.css">

</head>

<body>

    <c:import url="/components/header.jsp"/>

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="clientes"/>
        </c:import>

        <div class="column ps-content">

            <div class="is-flex is-justify-content-space-between is-align-items-center mb-4">
                
                <div class="control has-icons-right">
                    <span class="icon is-small is-right">
                        <i class="fas fa-search"></i>
                    </span>
                    <input class="input" type="text" placeholder="Buscar por ...">
                </div>

                <a href="${pageContext.request.contextPath}/registers/client-register.jsp" class="button is-success">
                    Novo Cliente
                </a>
                
            </div>
            
           	<div class="box ps-table-container">
	           	<table class="table is-fullwidth is-hoverable">
	                <thead>
	                    <tr>
	                        <th>Nome</th>
	                        <th>CPF</th>
	                        <th>Nascimento</th>
	                        <th>E-mail</th>
	                        <th>Telefone</th>
	                    </tr>
	                </thead>
	
	                <tbody>
	                
	                	<jsp:useBean id="dao" class="br.tsi.petshop.dao.ClientDAO" />
	                	
	                	<c:forEach var="client" items="${dao.clientsList()}" varStatus="id">
							<tr>
								<td>${client.name}</td>
								<td>${client.cpfFormatted}</td>
								<td>${client.birthFormatted}</td>
								<td>${client.email}</td>
								<td>${client.number}</td>
							</tr>
						</c:forEach>
	                
	                </tbody>
	            </table>
           	</div>
           	
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
