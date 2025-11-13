<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="/aut.jsp" %>

<!DOCTYPE html>
<html lang="pt-br" data-theme="light">

<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
  
  	<title>Cadastrar Cliente - Cao Q Late</title>
    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard-layout.css">
</head>

<style>
	.ps-big-input{
		width: 90% !important;
	}
</style>

<body>

    <c:import url="/components/header.jsp"/>
	<c:import url="/components/message.jsp"/>
	
    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="clientes"/>
        </c:import>

        <div class="column ps-content">
	    	<form action="${pageContext.request.contextPath}/controllersvlt" method="post">
		        
		        <div class="is-flex is-justify-content-right is-align-items-center mb-4">
		            <div class="is-flex is-align-items-center">
		                <div><a href="${pageContext.request.contextPath}/views/clients.jsp" class="has-text-danger has-text-weight-semibold mr-5">Cancelar</a></div>
		                <input type="text" hidden="true" name="action" value="AddClientAction">
		                <button type="submit" class="button is-success has-text-weight-semibold">Cadastrar</button>
		            </div>
		        </div>
		
		        <div class="columns is-multiline ml-5">
		        
		            <div class="column is-half">
		                <label class="label">Nome</label>
		                <div class="control">
		                    <input class="input ps-big-input" type="text" name="name" placeholder="Digite o nome completo" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
		                <label class="label">CPF</label>
		                <div class="control">
		                    <input class="input" type="text" name="cpf" maxlength="11" inputmode="numeric" pattern="\d{11}" placeholder="Somente números" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
		                <label class="label">Email</label>
		                <div class="control">
		                    <input class="input ps-big-input" type="email" name="email" placeholder="client@email.com" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
		                <label class="label">Telefone</label>
		                <div class="control">
		                    <input class="input" type="text" name="number" placeholder="(99) 99999-9999" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
		                <label class="label">Data de Nascimento</label>
		                <div class="control">
		                    <input class="input" type="date" name="birth" required>
		                </div>
	            	</div>
		            
		        </div>
		    </form>
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
