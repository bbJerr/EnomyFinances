<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Page</title>
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="header.jsp" %>
      <header class="py-4" style="background-image: url(images/register-bg.jpg);">
          <div class="container">
              <div class="row justify-content-center welcome-box">
                  <div class="col-lg-8 col-xxl-6">
                      <div class="text-center my-5">
                          <h1 class="fw-bolder mb-3">Welcome Back!</h1>
                          <p class="lead fw-normal mb-4" style="color: white;">We're thrilled to have you here with us again. Your presence adds so much to our community, and we're excited for the experiences we'll share together. </p>
                      </div>
                  </div>
              </div>
          </div>
      </header>
      <!-- Page Content-->
      <section class="py-5">
          <div class="container px-5 my-4">
              <div class="row gx-5">
                  	  <p class="h1 mb-3" style="color: #561C24">Explore Our Services Below</p>                   
                      <p class="lead fw-normal text-muted" style="text-align: justify;">Whether you're looking to exchange currencies for travel or business, or seeking to grow your wealth through smart financial decisions, we're here to help. Our currency conversion platform offers real-time exchange rates and convenient tools to calculate conversions effortlessly. Meanwhile, our savings and investment solutions provide personalized strategies to maximize your financial potential and secure your future.</p>				     			      
				  <div class="col-lg-6">
				  	<div class="welcome-image-container">
				    	<a href="currency">				        
				            <img class="img-fluid rounded-3 mb-5" src="images/stack-coins-bg.jpg" alt="Currency Conversion" />
				            <div class="module-overlay rounded-3 mb-5">
				                <p class="h2" style="color:white;">Currency Conversion</p>
				            </div>
				        </a>
				    </div>				    
				   </div>
				   <div class="col-lg-6">
				   	 <div class="welcome-image-container">
					    <a href="investment">					        
				            <img class="img-fluid rounded-3 mb-5" src="images/invest-bg.jpg" alt="Savings and Investments" />
				            <div class="module-overlay rounded-3 mb-5">
				                <p class="h2" style="color:white;">Savings and Investments</p>
				            </div>					        
					    </a>
					  </div>
				   </div>         
              </div>                                           
          </div>
      </section>
<%@ include file="footer.jsp" %>
</body>
</html>