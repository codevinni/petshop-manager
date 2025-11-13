<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>

<html data-theme="light">

	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
		<title>Petshop Manager</title>
		
		<link rel="icon" href="${pageContext.request.contextPath}/assets/img/cql-fav.ico"/>
		
		<!-- Bulma CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
		
		<style>
	        .ps-logout{
	            color: #f1b722 !important;
	            text-decoration: none;
	            font-weight: 700;
	        }
    	</style>
	</head>
	
	<body>
		<header class="ps-header columns is-vcentered p-3">
		
			<div class="column has-text-centered">
				<img id="logo" alt="Logo" src="${pageContext.request.contextPath}/assets/img/CaoQLate.png">
			</div>
			
			<c:if test="${sessionScope.status == true}">
				<div class="column is-narrow has-text-right is-align-self-flex-start">
					<a class="ps-logout" href="${pageContext.request.contextPath}/controllersvlt?action=LogoutAction">Logout <i class="fas fa-sign-out-alt fa-lg"></i></a>
				</div>
			</c:if>
		</header>
	</body>
	
</html>