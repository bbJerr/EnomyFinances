<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Landing Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body>
	<%@ include file="header.jsp" %>
		<header class="index-header-color py-5">
            <div class="container px-5">
                <div class="row gx-5 align-items-center justify-content-center">
                    <div class="col-lg-8 col-xl-7 col-xxl-6">
                        <div class="my-5 text-center text-xl-start">
                            <h1 class="display-5 fw-bolder text-white mb-4">Enomy Finances</h1>
                            <p class="lead fw-normal text-white-50 mb-4">Discover tailored advice, innovative solutions for savings and investments, and empower yourself with user-friendly tools and personalized investment plans. Start your journey towards financial success with Enomy Finance.</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                <a class="btn btn-lg px-4 me-sm-3 learn-more-button" href="#features">Learn More</a>
                                <a class="btn btn-outline-light btn-lg px-4" href="register">Join Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="images/index-header-picture.jpg" alt="..." /></div>
                </div>
            </div>
        </header>
        <!-- Features section-->
        <section class="py-5" id="features">
            <div class="container px-5 my-5">
                <div class="row gx-5">
                    <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start investing.</h2></div>
                    <div class="col-lg-8">
                        <div class="row gx-5 row-cols-1 row-cols-md-2">
                            <div class="col mb-5 h-100">
                                <div class="feature bg-gradient text-white rounded-3 mb-3"><i class="fa fa-credit-card" id="index-fafa"></i></div>
                                <h2 class="h5">Better Transactions</h2>
                                <p class="mb-0">Enjoy secure and effortless transactions, access credit facilities, and manage your finances conveniently.</p>
                            </div>
                            <div class="col mb-5 h-100">
                                <div class="feature bg-gradient text-white rounded-3 mb-3"><i class="fa fa-handshake-o" id="index-fafa"></i></div>
                                <h2 class="h5">Financial Partnership</h2>
                                <p class="mb-0">Partner with us for trustworthy financial advice, reliable services, and a collaborative approach to achieving your financial goals.</p>
                            </div>
                            <div class="col mb-5 mb-md-0 h-100">
                                <div class="feature bg-gradient text-white rounded-3 mb-3"><i class="fa fa-bar-chart" id="index-fafa"></i></div>
                                <h2 class="h5">Financial Growth</h2>
                                <p class="mb-0">Track and visualize your financial growth. Receive personalized insights, investment plans, and charts to help you make informed decisions.</p>
                            </div>
                            <div class="col h-100">
                                <div class="feature bg-gradient text-white rounded-3 mb-3"><i class="fa fa-money" id="index-fafa"></i></div>
                                <h2 class="h5">Better Tools</h2>
                                <p class="mb-0">We empower you to manage your money effectively, offering tools for savings, investments, and currency conversions.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial section-->
        <div class="py-5 bg-light">
            <div class="container px-5 my-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-10 col-xl-7">
                        <div class="text-center">
                            <div class="fs-4 mb-4 fst-italic">"Financial success is the result of meticulous planning, disciplined execution, and a commitment to continuous learning."</div>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="rounded-circle me-3" src="images/warren-buffet.png" alt="Warren Buffet" width="40" height="auto"/>
                                <div class="fw-bold">
                                    Warren Buffet
                                    <span class="fw-bold text-danger mx-1">/</span>
                                    CEO, Berkshire Hathaway
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<%@ include file="footer.jsp" %>
</body>
</html>