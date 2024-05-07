<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Investment Page</title>
<%@ page isELIgnored="false" %>
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="header.jsp"%>
<!-- Investment details section -->
<div class= " mx-auto pt-5 w-50">
	<h2 class="text-uppercase my-1 text-center">INVESTMENT PLAN</h2>
	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingOne">
	      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	      Option 1: Basic Savings Plan
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        <li><b>Maximum investment per year:</b> £20 000 </li>
			<li><b>Minimum monthly investment:</b> £50 </li>
			<li><b>Minimum initial investment lump sum:</b> N/A </li>
			<li><b>Predicted returns per year:</b> 1.2% to 2.4% </li>
			<li><b>Estimated tax:</b> 0% </li>
			<li><b>RBSX group fees per month:</b> 0.25%</li>
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	        Option 2: Savings Plan Plus
	      </button>
	    </h2>
	    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        <li><b>Maximum investment per year:</b> £30 000 </li>
			<li><b>Minimum monthly investment:</b> £50 </li>
			<li><b>Minimum initial investment lump sum:</b> £300 </li>
			<li><b>Predicted returns per year:</b> 3% to 5.5% </li>
			<li><b>Estimated tax:</b> 10% on profits above £12 000 </li>
			<li><b>RBSX group fees per month:</b> 0.3% </li>
	      </div>
	    </div>
	  </div>
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	        Option 3: Managed Stock Investments
	      </button>
	    </h2>
	    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        <li><b>Maximum investment per year:</b> Unlimited </li>
			<li><b>Minimum monthly investment:</b> £150 </li>
			<li><b>Minimum initial investment lump sum:</b> £1000 </li>
			<li><b>Predicted returns per year:</b> 4% to 23% </li>
			<li><b>Estimated tax:</b> 10% on profits above £12 000, 20% on profits above £40 000</li>
			<li><b>RBSX group fees per month:</b> 1.3%</li>
	      </div>
	  	</div>
	  </div>
	</div>
</div>    
<!-- Investment form section -->
<div class="col-md-4 mx-auto my-5">
    <h2 class="text-uppercase my-1 text-center">Choose Investment Plan</h2>
    <form:form action="calculateInvestment" method="post" modelAttribute="investmentForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        <div class="mb-3">
            <label for="initialLumpSum" class="form-label">Initial Lump Sum:</label>
            <input type="number" id="initialLumpSum" name="initialLumpSum" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="monthlyInvestment" class="form-label">Monthly Amount:</label>
            <input type="number" id="monthlyInvestment" name="monthlyInvestment" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="investmentType" class="form-label">Investment Type:</label>
            <select id="investmentType" name="investmentType" class="form-select" required>
             <option value="Basic Savings Plan">Basic Savings Plan</option>
             <option value="Savings Plan Plus">Savings Plan Plus</option>
             <option value="Managed Stock Investments">Managed Stock Investments</option>
        	</select>
        </div>
        <c:if test="${not empty investmentError}">
		    <div class="alert alert-danger" role="alert">
		        ${investmentError}
		    </div>
		</c:if>
        <button type="submit" class="btn convert-button">Calculate Investment</button>
    </form:form>
</div>
       
<%if(request.getAttribute("investmentSuccess") != null){ %>
        <div class="container py-5">  
		    <div class="row justify-content-center">
		        <div class="col-md-9">          
		             <h2 class="text-uppercase text-center mb-4">Investment Results</h2>
		             	<div class="lead fw-normal mb-4">                         
			             <table class="table">
							 <tbody>							    
						       <tr>
						         <td colspan="5" class="text-uppercase text-center"><b>${investmentType}</b></td>						       
						       <tr>
						         <td colspan="3" class="text-center"><b>Initial Lump Sum:</b> £${initialLumpSum}</td>
						         <td colspan="2" class="text-center"><b>Monthly Investment:</b> £${monthlyInvestment}</td>
						       </tr>
							   <tr>
							     <th>Time Frame</th>
							     <th>Returns</th>
							     <th>Total Profit</th>
							     <th>Total Fees Paid</th>
							     <th>Total Taxes Paid</th>
							   </tr>
							   <tr>
							     <td>1 year</td>
							     <td>£${oneYearReturn}</td>
							     <td>£${oneYearProfit}</td>
							     <td>£${oneYearFees}</td>
							     <td>£${oneYearTaxes}</td>
							   </tr>
							   <tr>
							     <td>5 years</td>
							     <td>£${fiveYearReturn}</td>
							     <td>£${fiveYearProfit}</td>
							     <td>£${fiveYearFees}</td>
							     <td>£${fiveYearTaxes}</td>
							   </tr>
							   <tr>
							     <td>10 years</td>
							     <td>£${tenYearReturn}</td>
							     <td>£${tenYearProfit}</td>
							     <td>£${tenYearFees}</td>
							     <td>£${tenYearTaxes}</td>
							   </tr>
							 </tbody>
						</table>
             		</div> 
        		</div>
   			 </div>
		</div>
	<% } %>

	<%@ include file="footer.jsp"%>
</body>
</html>