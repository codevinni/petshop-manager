<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="aut.jsp" %>

<!DOCTYPE html>
<html lang="pt-br" data-theme="light">

<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard - Cão Q Late</title>

    <!-- Bulma CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.4/css/bulma.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard-layout.css">
</head>

<style>
	.ps-center-msg{
		font-size: 30px;
		font-weight: bold;
		color: #d9d9d9;
	}
</style>

<body>
	
    <c:import url="/components/header.jsp"></c:import>

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value=""/>
        </c:import>

        <div class="is-align-items-center is-justify-content-center has-text-centered column is-flex">
                <div class="ps-center-msg">NAVEGUE ATRAVÉS DO MENU LATERAL</div>
        </div>
        
    </div>

     <c:import url="/components/footer.jsp"></c:import>

</body>

<script src="https://kit.fontawesome.com/42a12cf5f7.js"></script>
</html>
