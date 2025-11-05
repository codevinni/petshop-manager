<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
<!DOCTYPE html>

<html data-theme="light">

	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
		<title>Petshop Manager</title>
		
		<!-- Bulma CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
		
		<!-- Animate -->
		<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css">
	</head>

	<body class="animate__animated">
		
		<c:import url="/components/header.jsp"></c:import>
		
		<section class="hero-container container is-fluid">

        	<div class="animate__animated animate__bounceInLeft left-box">
	            <h2>
	                COMECE <strong>AGORA</strong><br>
	                A GERENCIAR O<br>
	                SEU PETSHOP
	            </h2>
	            <a href="${pageContext.request.contextPath}/login.jsp" id="button">Fazer Login</a>
	        </div>
	
	        <div class="animate__animated animate__bounceInRight right-container">
	            <div class="info-box">
	                <p>A melhor maneira de administrar<br>seus serviços e clientes</p>
	            </div>
	
	            <div class="dog-box">
	                <img src="${pageContext.request.contextPath}/assets/img/golden-dog.png" alt="Golden">
	            </div>
	        </div>

    	</section>
		
	</body>
	
</html>