<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password Page</title>
<%@ page isELIgnored="false" %>
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="reset-password" style="padding-top: 50px; padding-bottom:80px">
	    <div class="d-flex justify-content-center">
	        <div class="col-5 px-5 py-2 d-flex flex-column justify-content-center">
	            <h2 class="text-uppercase mb-3 text-center">Reset password</h2>
	            <p class="text-center">Enter your email and create your new password.</p>
	
	            <form:form action="resetpasswordform" method="post">
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	            
	                <div class="form-outline mb-4">
	                	<label for="email">Email address</label>
	                    <input type="email" class="form-control"  id="emailAddress" name="email" required>
	                </div>
	               <div class="form-outline mb-4">
	                        <label for="password" class="form-label">New Password</label>
	                        <input type="password" class="form-control" id="password" name="newPassword" required>
	               </div>
	               <div class="form-outline mb-4">
	                        <label for="password" class="form-label">Confirm New Password</label>
	                        <input type="password" class="form-control" id="passwordConfirmation" name="newPasswordConfirmation" required>
	               </div>	               
	               <c:if test="${not empty passwordMismatchError}">
					    <div class="alert alert-danger" role="alert">
					        ${passwordMismatchError}
					    </div>
				   </c:if>
				   <c:if test="${not empty error}">
					    <div class="alert alert-danger" role="alert">
					        ${error}
					    </div>
				   </c:if>	                
			       <button type="submit" class="btn btn-block btn-lg save-button">Save Changes</button>
		            
		          </form:form>
		    </div>      
        </div> 
	</div>
   
<%@ include file="footer.jsp" %>
</body>
</html>