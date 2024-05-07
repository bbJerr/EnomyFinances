<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background-color: #561C24;">
    <div class="container px-5">
        <a class="navbar-brand" href='<sec:authorize access="isAuthenticated()">welcome</sec:authorize><sec:authorize access="!isAuthenticated()">/EnomyFinancesSRC/</sec:authorize>'>
	    <img src="images/enomyfinances-logo-white.png" height="18" alt="Enomy Finances Logo" loading="lazy" style="margin-top: -1px;" />
		</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href='<sec:authorize access="isAuthenticated()">welcome</sec:authorize><sec:authorize access="!isAuthenticated()">/EnomyFinancesSRC/</sec:authorize>'>Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about">About Us</a></li>
                
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="currency">Currency Conversion</a></li>
                    <li class="nav-item"><a class="nav-link" href="investment">Investment Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="dashboard">Dashboard</a></li>
                </sec:authorize>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">

                        <sec:authorize access="isAuthenticated()">
                            <form:form action="logout" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                
                                <li><button type="submit" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Logout</button></li>                                
                            </form:form>
                        </sec:authorize>

                        <sec:authorize access="!isAuthenticated()">  
                            <li><a class="dropdown-item" href="login"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                            <li><a class="dropdown-item" href="register"><i class="fas fa-user-plus"></i> Register</a></li>
                        </sec:authorize>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

      <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/javascript.js"></script>
</body>
</html>
