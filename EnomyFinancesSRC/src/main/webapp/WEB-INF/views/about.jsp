<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>About Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="css/styles.css" rel="stylesheet"/>
</head>
<body class="d-flex flex-column">
	<%@ include file="header.jsp" %>
		<main class="flex-shrink-0">
			<!-- Header-->
            <header class="py-5">
                <div class="container px-6">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-xxl-8">
                            <div class="text-center my-5">
                                <h1 class="fw-bolder mb-5">Our mission is to empower clients by providing comprehensive financial solutions tailored to their needs.</h1>                                
                                <a class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="#scroll-target">More About Us Below</a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- About section one-->
            <section class="py-5 bg-light" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="images/index-header-picture.jpg" alt="about picture 1" /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder">Our Story</h2>
                            <p class="lead fw-normal text-muted mb-0">Enomy-Finances was founded with a vision to provide financial guidance and support to individuals and businesses.</p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About section two-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6 order-first order-lg-last"><img class="img-fluid rounded mb-5 mb-lg-0" src="images/money-bg.jpg" alt="about picture 2" /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder">Our Growth &amp; Vision</h2>
                            <p class="lead fw-normal text-muted mb-0">As we grow, our commitment to providing innovative financial solutions remains unwavering.</p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Contact Us section -->
        <section class="py-5 bg-light">
            <div class="container px-5 my-5">
                <div class="text-center">
                    <h2 class="fw-bolder">Contact Us</h2>
                    <p class="lead fw-normal text-muted mb-5">Get in touch with us for any inquiries</p>
                </div>
                <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                    <!-- Phone -->
                    <div class="col mb-5 mb-5 mb-xl-0">
                        <div class="text-center">
                            <i class="fas fa-phone fa-3x mb-4" id="fafa-contact"></i>
                            <h5 class="fw-bolder">Phone</h5>
                            <div class="text-muted">+123 456 7890</div>
                        </div>
                    </div>
                    <!-- Mail -->
                    <div class="col mb-5 mb-5 mb-xl-0">
                        <div class="text-center">
                            <i class="fas fa-envelope fa-3x mb-4" id="fafa-contact"></i>
                            <h5 class="fw-bolder">Email</h5>
                            <div class="text-muted">info@enomyfinances.com</div>
                        </div>
                    </div>
                    <!-- Location -->
                    <div class="col mb-5 mb-5 mb-sm-0">
                        <div class="text-center">
                            <i class="fas fa-map-marker-alt fa-3x mb-4" id="fafa-contact"></i>
                            <h5 class="fw-bolder">Location</h5>
                            <div class="text-muted">123 Main St, Cityville</div>
                        </div>
                    </div>
                    <!-- Placeholder Icon -->
                    <div class="col mb-5">
                        <div class="text-center">
                            <i class="fas fa-question fa-3x mb-4" id="fafa-contact"></i>
                            <h5 class="fw-bolder">Something Else</h5>
                            <div class="text-muted">Lorem Ipsum</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		</main>
	<%@ include file="footer.jsp" %>
</body>
</html>