<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        	<c:param name="activePage" value="servicos"/>
        </c:import>

        <div class="column ps-content">

            <div class="is-flex is-justify-content-right is-align-items-center mb-4">
                
                <a href="${pageContext.request.contextPath}/registers/service-register.jsp" class="button is-success">
                    Novo Serviço
                </a>
                
            </div>
           
            <div class="box ps-table-container">
	           	<table class="table is-fullwidth is-hoverable is-vcentered">
	                 <thead>
			            <tr>
			                <th class="">Serviço</th>
			                <th class="">Preço (R$)</th>
			                <th></th>
			            </tr>
			        </thead>
			
			        <tbody>
			        
			            <jsp:useBean id="dao" class="br.tsi.petshop.dao.ServiceDAO" />
			
			            <c:forEach var="service" items="${dao.listAll()}" varStatus="id">
			                <tr>
			                    <td class="">${service.name}</td>
			                    <td class="">R$ <fmt:formatNumber value="${service.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/></td>
			                    <td class="has-text-right">
			                    	<a href="${pageContext.request.contextPath}/registers/service-edit.jsp?name=${service.name}" class="mr-4 button is-success">
	                    				Editar
	                				</a>
	                			</td>
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
