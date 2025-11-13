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
	

</head>

<body>

    <c:import url="/components/header.jsp"/>
	<c:import url="/components/message.jsp"/>

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="agendamentos"/>
        </c:import>

        <div class="column ps-content">
			<form action="${pageContext.request.contextPath}/controllersvlt" method="post">

				<div class="is-flex is-justify-content-right is-align-items-center mb-4">
		            <div class="is-flex is-align-items-center">
		            	<div><a href="${pageContext.request.contextPath}/views/appointments.jsp" class="has-text-danger has-text-weight-semibold mr-5">Cancelar</a></div>
		                <input type="text" hidden="true" name="action" value="ConfirmAppointmentAction">
		                <button type="submit" class="button is-success has-text-weight-semibold">Lançar</button>
		            </div>
		        </div>

			 	<div class="columns is-multiline ml-5">
	
		            <div class="column">
		                <label class="label">Datas</label>
		                <div class="box">
		                    <p><strong>Data Agendada:</strong> ${appointment.dateFormatted}</p>
		                    <label class="label mt-2">Data de Realização</label>
		                    <div class="control">
		                    	<input type="hidden" name="id" value="${appointment.id}">
		                        <input class="input" type="date" name="date" required>
		                    </div>
		                </div>
		            </div>
		
		            <div class="column is-full mt-2">
		                <label class="label">Serviços</label>
		                <div class="box">
		                    <ul>
		                        <c:forEach var="service" items="${appointment.services}">
		                            <li>${service.name} - R$ <fmt:formatNumber value="${service.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/></li>
		                        </c:forEach>
		                    </ul>
		                </div>
		            </div>
		
		            <div class="column is-three-quarters">
		                <div class="box">
		                    <p><strong>Total:</strong>
		                        R$
		                        <c:set var="total" value="0" />
		                        <c:forEach var="service" items="${appointment.services}">
		                            <c:set var="total" value="${total + service.price}" />
		                        </c:forEach>
		                        <fmt:formatNumber value="${total}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
		                    </p>
		                </div>
		            </div>
		
		            <div class="column is-one-quarter has-text-right">
		                <div class="">
		                    <c:choose>
		                        <c:when test="${appointment.getServicesCount() >= 3}">
		                            <p class="has-text-success has-text-weight-semibold">Desconto aplicado: 10%</p>
		                            <p>
		                                <strong>Total com desconto:</strong>
		                                R$ <fmt:formatNumber value="${total * 0.9}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
		                            </p>
		                        </c:when>
		                        <c:otherwise>
		                            <p class="has-text-grey">Sem desconto aplicado</p>
		                        </c:otherwise>
		                    </c:choose>
		                </div>
		            </div>
			 
				</div>
		 	</form>
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
