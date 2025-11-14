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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/views.css">

</head>

<body>

    <c:import url="/components/header.jsp"/>

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="caes"/>
        </c:import>

        <div class="column ps-content">

            <div class="is-flex is-justify-content-space-between is-align-items-center mb-4">
                
                <div class="control has-icons-right">
                    <span class="icon is-small is-right">
                        <i class="fas fa-search"></i>
                    </span>
                    <input class="input" type="text" placeholder="Buscar por ...">
                </div>

                <a href="${pageContext.request.contextPath}/registers/dog-register.jsp" class="button is-success">
                    Novo Cão
                </a>
                
            </div>
            <div class="box ps-table-container">
	           	<table class="table is-fullwidth is-hoverable">
	                <thead>
	                    <tr>
	                        <th>Id</th>
	                        <th>Nome</th>
	                        <th>Raça</th>
	                        <th>Porte</th>
	                        <th>CPF do Dono</th>
	                    </tr>
	                </thead>
	
	                <tbody>
	                
	                	<jsp:useBean id="dao" class="br.tsi.petshop.dao.DogDAO" />
	                	<jsp:useBean id="clientDao" class="br.tsi.petshop.dao.ClientDAO" />
	                	
	                	<c:forEach var="dog" items="${dao.dogsList()}" varStatus="id">
							<tr>
								<td>${dog.id}</td>
								<td>${dog.name}</td>
								<td>${dog.size}</td>
								<td>${dog.dogBreed}</td>
								
								<c:set var="client" value="${clientDao.search(dog.ownerId)}"/>
								<td>${client.cpfFormatted}</td>
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
