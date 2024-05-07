<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link href="css/styles.css" rel="stylesheet"/>
<%@ page isELIgnored="false" %>
</head>
<body>
	<%@ include file="header.jsp" %>
		<section class="vh-100 bg-image"
		  style="background-image: url(images/register-bg.jpg); background-size:cover;">
		  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
		    <div class="container h-100">
		      <div class="row d-flex justify-content-center align-items-center h-100">
		        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
		          <div class="card" style="border-radius: 15px;">
		            <div class="card-body p-5">
		              <h2 class="text-uppercase text-center mb-5">Login</h2>
		
		              <form:form action="login" method="post">
		              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		                <div class="form-outline mb-4">
		                  <input type="email" id="email" class="form-control form-control-lg" name = "username" required/>
		                  <label class="form-label" for="emailAddress">Email Address</label>
		                </div>
		
		                <div class="form-outline mb-4">
		                  <input type="password" id="password" class="form-control form-control-lg" name = "password" required/>
		                  <label class="form-label" for="password">Password</label>
		                </div>
		                
		                <!-- login error here -->
						<c:if test="${not empty loginError}">
						    <div class="alert alert-danger" role="alert">
						        ${loginError}
						    </div>
						</c:if>
						
		                <div class="d-flex justify-content-center">
		                  <button type = "submit" value = "LOGIN"
		                    class="btn btn-block btn-lg login-button">Login</button>
		                </div>
						<div class="text-center mt-5">
						    <a href="resetpassword" class="text-decoration-none text-reset"><u>Forgot password.</u></a>
						</div>
		                    
		                <p class="text-center text-muted mt-3 mb-0">Don't have an account? <a href="register"
		                    class="fw-bold text-body"><u>Register Now</u></a></p>
		
		              </form:form>
		
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
	<%@ include file="footer.jsp" %>
</body>
</html>