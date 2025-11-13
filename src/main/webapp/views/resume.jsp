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
        	<c:param name="activePage" value="relatorio"/>
        </c:import>

        <div class="column ps-content">
			
            <form method="get" class="mb-4 is-flex is-align-items-end">
            
			    <div class="mr-3">
			        <label class="label">De:</label>
			        <input class="input" type="date" name="from" value="${param.from}">
			    </div>
			    
			    <div class="mr-3">
			        <label class="label">Até:</label>
			        <input class="input" type="date" name="to" value="${param.to}">
			    </div>
			    <button class="button is-success has-text-weight-semibold">Filtrar</button>
			</form>
            
		    <jsp:useBean id="dao" class="br.tsi.petshop.dao.ServiceProvisionDAO" />
		
		    <c:choose>
		        
		        <c:when test="${not empty param.from and not empty param.to}">
		            <c:set var="provisions" value="${dao.listByDateRange(param.from, param.to)}" />
		        </c:when>
		
		        <c:otherwise>
		            <c:set var="provisions" value="${dao.listAll()}" />
		        </c:otherwise>
		        
		    </c:choose>
		    
		    <c:set var="total" value="0"/>
		    
		    <c:forEach var="p" items="${provisions}">
		        <c:set var="total" value="${total + p.totalValue}" />
		    </c:forEach>
		
		    
	        <p class="box is-size-6 mt-5">
	            <strong>Faturamento total:</strong>
	            R$ <fmt:formatNumber value="${total}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
	        </p>
          
           	<table class="table is-fullwidth is-hoverable ps-table">
		        <thead>
		            <tr>
		                <th>ID do Agendamento</th>
		                <th>Data da Realização</th>
		                <th>Valor Total</th>
		            </tr>
		        </thead>
		
		        <tbody>
		           
			        <c:forEach var="p" items="${provisions}">
			            <tr>
			                <td>${p.appointmentId}</td>
			                <td>${p.dateFormatted}</td>
			                <td>R$ <fmt:formatNumber value="${p.totalValue}" type="number" minFractionDigits="2" maxFractionDigits="2"/></td>
			            </tr>
			        </c:forEach>
		               
		        </tbody>
		    </table>
           
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
