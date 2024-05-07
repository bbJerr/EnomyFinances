<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard Page</title>
<%@ page isELIgnored="false" %>
</head>
<body>
<%@ include file="header.jsp"%>
<!-- Page Content-->
            <section class="py-5">
                <div class="container px-5">
                    <h1 class="fw-bolder fs-5 mb-4">Dashboard</h1>
                    <div class="card border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row gx-0">
                                <div class="col-lg-6 col-xl-5 py-lg-5">
                                    <div class="p-4 p-md-5">
                                        <div class="h2 fw-bolder">Hello, ${name}</div>
                                        <p>This is your dashboard.</p>                                      
                                        <a class="stretched-link text-decoration-none" href="#history">
                                            See more
                                            <i class="bi bi-arrow-down"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xl-7" style="background-image: url('images/invest-bg.jpg')"></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
<sec:authorize access="isAuthenticated() && hasRole('Client')">
<div class="container py-5" id="history">  
    <div class="row justify-content-center">
        <div class="col-md-auto text-center">          
             <h2 class="mb-4">Investment History</h2>
             	<div class="table-responsive">           	                        
	             <table class="table table-sm">
				 <tbody>							    				      
				   <tr style="font-size: 0.8rem;">
				     <th>Investment Number</th>
				     <th>Investment Type</th>
				     <th>Initial Lump Sum</th>
				     <th>Monthly Investment</th>
				     <th>1-Year Return</th>
				     <th>5-Year Return</th>
				     <th>10-Year Return</th>
				     <th>1-Year Profit</th>
				     <th>5-Year Profit</th>
				     <th>10-Year Profit</th>
				     <th>1-Year Fees</th>
				     <th>5-Year Fees</th>
				     <th>10-Year Fees</th>
				     <th>1-Year Taxes</th>
				     <th>5-Year Taxes</th>
				     <th>10-Year Taxes</th>
				   </tr>					   
                	<c:forEach items="${userInvestments}" var="investment">
				   <tr style="font-size: 0.8rem;">
				     <td>${investment.investmentId}</td>
				     <td>${investment.investmentType}</td>
				     <td>${investment.initialLumpSum}</td>
				     <td>${investment.monthlyInvestment}</td>
				     <td>${investment.oneYearReturn}</td>
				     <td>${investment.fiveYearReturn}</td>
				     <td>${investment.tenYearReturn}</td>
				     <td>${investment.oneYearTotalProfit}</td>
				     <td>${investment.fiveYearTotalProfit}</td>
				     <td>${investment.tenYearTotalProfit}</td>
				     <td>${investment.oneYearTotalFees}</td>
				     <td>${investment.fiveYearTotalFees}</td>
				     <td>${investment.tenYearTotalFees}</td>
				     <td>${investment.oneYearTotalTaxes}</td>
				     <td>${investment.fiveYearTotalTaxes}</td>
				     <td>${investment.tenYearTotalTaxes}</td>
				   </tr>
				   </c:forEach>					   
				 </tbody>
			   </table>
			</div>         	
      	</div>
 	</div>
</div>
</sec:authorize>
<sec:authorize access="isAuthenticated() && hasRole('Admin')">
<div class="container py-5" id="history">  
    <div class="row justify-content-center">
        <div class="col-md-auto text-center">          
             <h2 class="mb-4">All Accounts</h2>
               <div class="table-responsive">             	                        
	             <table class="table table-sm">
				 <tbody>							    				      
				   <tr style="font-size: 0.8rem;">
				     <th>User ID</th>
				     <th>Name</th>
				     <th>Email</th>
				     <th>Password</th>
				     <th>Phone Number</th>
				     <th></th>				    
				   </tr>					   
                	<c:forEach items="${user}" var="user">
				   <tr style="font-size: 0.8rem;">
				     <td>${user.userId}</td>
				     <td>${user.name}</td>
				     <td>${user.email}</td>
				     <td>${user.password}</td>
				     <td>${user.phoneNumber}</td>
					 <td><a href="delete?userId=${user.userId}">Delete</a></td>				 
				   </tr>
				   </c:forEach>					   
				 </tbody>
			   </table> 
			</div>       	
      	</div>
 	</div>
</div>
</sec:authorize>
<%@ include file="footer.jsp"%>
</body>
</html>