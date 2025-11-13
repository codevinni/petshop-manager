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
        	<c:param name="activePage" value="servicos"/>
        </c:import>

        <div class="column ps-content">
	    	<form action="${pageContext.request.contextPath}/controllersvlt" method="post">
		        
		        <div class="is-flex is-justify-content-right is-align-items-center mb-4">
		            <div class="is-flex is-align-items-center">
		                <div><a href="${pageContext.request.contextPath}/views/services.jsp" class="has-text-danger has-text-weight-semibold mr-5">Cancelar</a></div>
		                <input type="text" hidden="true" name="action" value="EditServiceAction">
		                <button type="submit" class="button is-success has-text-weight-semibold">Atualizar</button>
		            </div>
		        </div>
		
		        <div class="columns is-multiline ml-5">
		
		            <div class="column is-half">
		                <label class="label">Novo Preço de "${param.name}"</label>
		                <div class="control">
		                    <input class="input" type="text" name="newprice" placeholder="Preço (ex: 35.50)" required>
		                    <input type="text" hidden="true" name="name" value="${param.name}">
		                </div>
		            </div>
		 
		        </div>
		    </form>
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
