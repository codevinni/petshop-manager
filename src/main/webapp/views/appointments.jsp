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
	<c:import url="/components/message.jsp"/>

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="agendamentos"/>
        </c:import>

        <div class="column ps-content">

			<div class="box ps-table-container">
	            <table class="table is-fullwidth is-hoverable">
	                <thead>
	                    <tr>
	                   		<th>Cliente</th>
				            <th>Cão</th>
				            <th>Serviços</th>
				            <th>Data</th>
				            <th>Status</th>
				            <th></th>
	                        <th></th>
	                    </tr>
	                </thead>
	
	                <tbody>
	                
	                	<jsp:useBean id="dao" class="br.tsi.petshop.dao.AppointmentDAO" />
				        <jsp:useBean id="clientDao" class="br.tsi.petshop.dao.ClientDAO" />
				        <jsp:useBean id="dogDao" class="br.tsi.petshop.dao.DogDAO" />
				        
				        <c:forEach var="appointment" items="${dao.listAll()}" varStatus="loop">
				            <tr>
				              
				                <td>
				                    <c:set var="client" value="${clientDao.search(appointment.clientId)}" />
				                    ${client.cpfFormatted}
				                </td>
				
				                <td>
				                    <c:set var="dog" value="${dogDao.search(appointment.dogId)}" />
				                    ${dog.name}
				                </td>
				
				                <td>
				                    <c:forEach var="service" items="${appointment.services}">
				                        <span class="tag is-light">${service.name}</span>
				                    </c:forEach>
				                </td>
				
				                <td>${appointment.dateFormatted}</td>
				
				                <td>${appointment.status}</td>
				
				                <td>
				                	 
				                	 <c:if test="${appointment.isCancelable() and appointment.status eq 'Pendente'}">
									    <form action="${pageContext.request.contextPath}/controllersvlt" method="post" 
									          onsubmit="return confirm('Tem certeza que deseja cancelar este agendamento?');">
									        
									        <input type="hidden" name="action" value="CancelAppointmentAction">
									        <input type="hidden" name="id" value="${appointment.id}">
									        
									        <button type="submit" class=" is-ghost has-text-danger has-text-weight-semibold">
									            Cancelar
									        </button>
									    </form>
									</c:if>
				                	 
				                </td>
				                
				                 <td>
				                	 
				                	 <c:if test="${appointment.status eq 'Pendente'}">
									    <form action="${pageContext.request.contextPath}/controllersvlt" method="post">
									        
									        <input type="hidden" name="action" value="CompleteAppointmentAction">
									        <input type="hidden" name="id" value="${appointment.id}">
									        
									        <button type="submit" class=" is-ghost has-text-success has-text-weight-semibold">
									            Lançar
									        </button>
									    </form>
									</c:if>
				                	 
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
