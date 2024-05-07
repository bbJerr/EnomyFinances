<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thank You Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
	<%@ include file="header.jsp" %>
		<div class="thank-you-message">
			<i class="fa fa-check-square" id="thankyou-fafa"></i>
	        <h1 class="text-uppercase text-center mb-4">Thank you for signing up!</h1>
	        <p class="mb-5">Your account has been created successfully. We look forward to having you as a member of our community.</p>
	    	<a href="login" class="btn btn-block btn-lg login-button-forward">Continue to Login</a>
	    </div>
	<%@ include file="footer.jsp" %>
</body>
</html>