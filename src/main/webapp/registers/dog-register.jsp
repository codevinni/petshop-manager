<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="/aut.jsp" %>

<!DOCTYPE html>
<html lang="pt-br" data-theme="light">

<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
  
  	<title>Cadastrar Cão - Cao Q Late</title>
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
        	<c:param name="activePage" value="caes"/>
        </c:import>

        <div class="column ps-content">
	    	<form action="${pageContext.request.contextPath}/controllersvlt" method="post">
		        
		        <div class="is-flex is-justify-content-right is-align-items-center mb-4">
		            <div class="is-flex is-align-items-center">
		                <div><a href="${pageContext.request.contextPath}/views/pets.jsp" class="has-text-danger has-text-weight-semibold mr-5">Cancelar</a></div>
		                <input type="text" hidden="true" name="action" value="AddDogAction">
		                <button type="submit" class="button is-success has-text-weight-semibold">Cadastrar</button>
		            </div>
		        </div>
		
		        <div class="columns is-multiline ml-5">
		        	
		            <div class="column is-half">
		                <label class="label">Nome</label>
		                <div class="control">
		                    <input class="input ps-big-input" type="text" name="name" placeholder="Digite o nome do cão" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
		                <label class="label">CPF do Dono</label>
		                <div class="control">
		                    <input class="input" type="text" name="cpf" maxlength="11" inputmode="numeric" pattern="\d{11}" placeholder="Somente números" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
		                <label class="label">Raça</label>
		                <div class="control">
		                    <input class="input ps-big-input" type="text" name="dogBreed" placeholder="Ex: Shitzu" required>
		                </div>
		            </div>
		
		            <div class="column is-half">
					    <label class="label">Porte</label>
					    <div class="control">
					        <div class="select ps-select">
					            <select name="size" required>
					                <option value="" disabled selected>Selecione o porte</option>
					                <option value="Pequeno">Pequeno</option>
					                <option value="Médio">Médio</option>
					                <option value="Grande">Grande</option>
					            </select>
					        </div>
					    </div>
					</div>
		 
		        </div>
		    </form>
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
