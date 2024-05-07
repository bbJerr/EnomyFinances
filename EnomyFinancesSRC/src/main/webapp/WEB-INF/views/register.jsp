<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<link href="css/styles.css" rel="stylesheet"/>
<%@ page isELIgnored="false" %>
</head>
<body>
	<%@ include file="header.jsp" %>
		<section class="vh-75 bg-image py-5"
		  style="background-image: url(images/register-bg.jpg); background-size:cover;">
		  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
		    <div class="container h-100">
		      <div class="row d-flex justify-content-center align-items-center h-100">
		        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
		          <div class="card" style="border-radius: 15px;">
		            <div class="card-body p-5">
		              <h2 class="text-uppercase text-center mb-5">Create an account</h2>
						
		              <form:form action="registerform" method="post">
		              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		                <div class="form-outline mb-4">
		                  <input type="text" id="name" class="form-control form-control-lg" name="name" required/>
		                  <label class="form-label" for="fullName">Full Name</label>
		                </div>
		 
		                <div class="form-outline mb-4">
		                  <input type="email" id="emailAddress" class="form-control form-control-lg" name="email" required/>
		                  <label class="form-label" for="emailAddress">Email Address</label>
		                </div>
		
		                <div class="form-outline mb-4">
		                  <input type="password" id="password" class="form-control form-control-lg" name="password" required/>
		                  <label class="form-label" for="password">Password</label>
		                </div>
		                 
						<div class="form-outline mb-4">	
						<label for="phoneNumber" class="form-label">Contact Number</label>			        
				        <input type="number" class="form-control form-control-lg" id="phoneNumber" name="phoneNumber" required>				        
				      	</div>
				      	  <script>
				      	    const phoneInputField = document.querySelector("#phoneNumber");
				       	    const phoneInput = window.intlTelInput(phoneInputField, {
				         	  utilsScript:
				           	  "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
				       	   });
				     	</script>
												
						<!-- email exists error -->
						<c:if test="${not empty emailExistsError}">
						    <div class="alert alert-danger" role="alert">
						        ${emailExistsError}
						    </div>
						</c:if>
						
		                <div class="d-flex justify-content-center" >
		                  <button type="submit" value="REGISTER"
		                    class="btn btn-block btn-lg register-button">Register</button>
		                </div>
		
		                <p class="text-center text-muted mt-5 mb-0">Already have an account? <a href="login"
		                    class="fw-bold text-body"><u>Login here</u></a></p>
		
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