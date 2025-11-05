<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

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

    <div class="columns ps-main">

        <c:import url="/components/sidebar.jsp">
        	<c:param name="activePage" value="caes"/>
        </c:import>

        <div class="column ps-content">

            <div class="is-flex is-justify-content-space-between is-align-items-center mb-4">
                
                <div class="control has-icons-right">
                    <span class="icon is-small is-right">
                        <i class="fas fa-search"></i>
                    </span>
                    <input class="input" type="text" placeholder="Buscar por ...">
                </div>

                <button class="button is-success">
                    Novo Cão
                </button>
                
            </div>
           
        </div>
        
    </div>

    <c:import url="/components/footer.jsp"/>

</body>

</html>
