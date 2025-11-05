<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
<!DOCTYPE html>

<html data-theme="light">

	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
		<title>Login - Petshop Manager</title>
		
		<!-- Bulma CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
	</head>

	<body>
		
		<c:import url="/components/header.jsp"></c:import>
		
		<div id="login-box" class="container is-fluid">
	
			<div class="field">
				<p class="control has-icons-left has-icons-right">
					<input class="input is-medium" type="text" placeholder="User">
					<span class="icon is-small is-left">
						<i class="fas fa-user"></i>
					</span>
				</p>
			</div>
			
			<div class="field">
				<p class="control has-icons-left">
					<input class="input is-medium" type="password" placeholder="Password">
					<span class="icon is-small is-left">
					<i class="fas fa-lock"></i>
					</span>
				</p>
			</div>
			
			<div class="field">
				<p class="control">
					<button class="is-medium button is-success">
						Login
					</button>
				</p>
			</div>
		
		</div>
		
	</body>
	
	<script src="https://kit.fontawesome.com/42a12cf5f7.js"></script>
	
</html>