<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>

<html data-theme="light">

	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
		<!-- Bulma CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
		
	</head>
	
	<body>
	
		<c:if test="${not empty erro}">
			<div class="container is-max-tablet">
			    <div class="box notification is-danger">
			        <button class="delete" onclick="this.parentElement.remove()"></button>
			        ${erro}
			    </div>
			</div>
   		</c:if>
   		
	</body>
	
</html>