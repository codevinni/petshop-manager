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
	

</head>

<body>

    <c:import url="/components/header.jsp"/>
	<c:import url="/components/message.jsp"/>

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="novo-agendamento"/>
        </c:import>

        <div class="column ps-content">
			<form action="${pageContext.request.contextPath}/controllersvlt" method="post">

				<div class="is-flex is-justify-content-right is-align-items-center mb-4">
		            <div class="is-flex is-align-items-center">
		                <input type="text" hidden="true" name="action" value="AddAppointmentAction">
		                <button type="submit" class="button is-success has-text-weight-semibold">Agendar</button>
		            </div>
		        </div>

			 	<div class="columns is-multiline ml-5">
			 	
		 			<div class="column is-half">
		                <label class="label">ID do Cão</label>
		                <div class="control">
		                    <input class="input" type="text" name="dogId" placeholder="Digite o ID do cão" required>
		                </div>
					</div>
	
					 <div class="column is-half">
		                <label class="label">Data do Agendamento</label>
		                 <div class="control">
	                		<input class="input" type="date" name="date" required>
	            		</div>
		            </div>
		            
		            <div class="column">
		            
			            <label class="label">Serviços</label>
			            
			            <div class="control">
			                <jsp:useBean id="dao" class="br.tsi.petshop.dao.ServiceDAO" />
			                <c:forEach var="service" items="${dao.listAll()}">
			                    <label class="checkbox mr-4">
			                        <input type="checkbox" name="services" value="${service.name}"> ${service.name}
			                    </label>
			                </c:forEach>
			            </div>
			            
			        </div>
		            
				</div>

		 	</form>
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
