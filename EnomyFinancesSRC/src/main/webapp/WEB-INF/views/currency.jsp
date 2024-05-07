<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Currency Conversion Page</title>
<%@ page isELIgnored="false" %>
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
    <%@ include file="header.jsp"%>    
    <div class="container my-5 py-3">
        <div class="row">
            <!-- Left Column for Information -->
            <div class="col-md-6">
                <div class="info-section">
                    <h4 class="text-uppercase mb-3">Transaction Limitations</h4>
                    <ul>
				        <li class="mb-2">Minimum transaction: 300 of the initial currency to be converted</li>
				        <li>Maximum transaction: 5000 of the initial currency to be converted</li>
				    </ul>
                    
                    <h4 class="text-uppercase mt-4 mb-3">Fee Charges</h4>
                    <table class="info-table">
                        <thead>
                            <tr>
                                <th>Initial Currency Amount</th>
                                <th>Fee</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Up to 500</td>
                                <td>3.5%</td>
                            </tr>
                            <tr>
                                <td>Over 500</td>
                                <td>2.7%</td>
                            </tr>
                            <tr>
                                <td>Over 1500</td>
                                <td>2.0%</td>
                            </tr>
                            <tr>
                                <td>Over 2500</td>
                                <td>1.5%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
		<!-- Right Column for Currency Conversion Form -->
            <div class="col-md-5">
                <h2 class="text-uppercase my-1 text-center">Currency Converter</h2>
                <form:form action="converter" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="mb-3">
                    <label for="amount" class="form-label">Enter amount:</label>
                    <input type="number" id="amount" name="amount" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="fromCurrency" class="form-label">From Currency:</label>
                    <select id="fromCurrency" name="fromCurrency" class="form-select" required>
                        <option value="GBP">GBP - British Pound Sterling</option>
                        <option value="USD">USD - United States Dollar</option>
                        <option value="EUR">EUR - Euro</option>
                        <option value="BRL">BRL - Brazilian Real</option>
                        <option value="JPY">JPY - Japanese Yen</option>
                        <option value="TRY">TRY - Turkish Lira</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="toCurrency" class="form-label">To Currency:</label>
                    <select id="toCurrency" name="toCurrency" class="form-select" required>
                        <option value="GBP">GBP - British Pound Sterling</option>
                        <option value="USD">USD - United States Dollar</option>
                        <option value="EUR">EUR - Euro</option>
                        <option value="BRL">BRL - Brazilian Real</option>
                        <option value="JPY">JPY - Japanese Yen</option>
                        <option value="TRY">TRY - Turkish Lira</option>
                    </select>
                </div>
                <c:if test="${not empty conversionError}">
				    <div class="alert alert-danger" role="alert">
				        ${conversionError}
				    </div>
				</c:if>
                <button type="submit" class="btn convert-button">Convert</button>
            </form:form>
        </div>       
    </div>
    <!-- Results Section -->
    <%if(request.getAttribute("conversionSuccess") != null){ %>
        <div class="container py-5">  
		    <div class="row justify-content-center"> 
		        <div class="col-md-8">         
		             <h2 class="text-uppercase mb-4">Currency Conversion Result</h2>
		             	<div class="lead fw-normal mb-4">                         
			             <table class="table">
			                 <tbody>
			                     <tr>
			                         <th>Buying or Selling Amount:</th>
			                         <td>${amount}</td>
			                     </tr>
			                     <tr>
			                         <th>From Currency:</th>
			                         <td>${fromCurrency}</td>
			                     </tr>
			                     <tr>
			                         <th>To Currency:</th>
			                         <td>${toCurrency}</td>
			                     </tr>
			                     <tr>
			                         <th>Converted Amount:</th>
			                         <td>${convertedAmount}</td>
			                     </tr>
			                     <tr>
			                         <th>Service Charges:</th>
			                         <td>${serviceCharges}</td>
			                     </tr>
			                     <tr>
			                         <th>Final Amount:</th>
			                         <td>${finalAmount}</td>
			                     </tr>
			                 </tbody>
			             </table>
             		</div> 
        		</div>
   			 </div>
		</div>
	<% } %>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
