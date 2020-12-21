<!doctype html>
<html class="no-js" lang="zxx">
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Easy Rent | Profile </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="../../assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../../assets/css/slicknav.css">
    <link rel="stylesheet" href="../../assets/css/flaticon.css">
    <link rel="stylesheet" href="../../assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="../../assets/css/gijgo.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="../../assets/css/animated-headline.css">
    <link rel="stylesheet" href="../../assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../../assets/css/slick.css">
    <link rel="stylesheet" href="../../assets/css/nice-select.css">
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../../assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="${pageContext.request.contextPath}/"><img src="../../assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10">
                                <div class="menu-wrapper  d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">
                                                <li> <a href="login-and-registration">Log Out</a></li>
                                                <li> <a href="login-and-registration">Contact Us</a></li>
                                                <li> <a href="#about">About</a></li>
                                                <li> <a href="\chat.html">Chat</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                    <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="${pageContext.request.contextPath}/postListing" class="border-btn">Post a Listing</a>
                                    </div>
                                </div>
                            </div> 
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <main>
        <!-- Hero Area Start-->
        <div class="slider-area2">
            <div class="single-slider slider-height3 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-9">
                            <!-- Hero Caption -->
                            <div class="hero__caption hero__caption2">
                                <h1>Welcome${username}!</h1>
                                <br> <h1>Rental Score(no. rent outs): ${averageRating}</h1>
                                <c:if test="${averageRating == 0}">
                                    <h1>Average Rating: N/A</h1>
                                </c:if>
                                <c:if test="${averageRating != 0}">
                                    <h1>Average Rating: ${averageRating}/5</h1>
                                </c:if>
                                <br>
                            </div>
                        </div>

                        <div class="col-xl-4 col-lg-3">
                        <img src="${loggedInUser.profilephoto}" style="box-shadow: 0 0 3px; float: right; border-radius:50%; max-width:100%;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <!--Hero Area End-->
       
        <!-- listing Area Start -->
        <div class="category-area top-jobs">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-50">
                            <c:choose>
                                <c:when test = "${filter =='favorites'}">
                                  <h2>Your Favorites</h2>
                                <p> These are listings you have added to your favorites. To remove a listing, go to its page and press "remove from favorites"! </p>
                                </c:when>
                                <c:when test = "${filter =='postings'}">
                                    <h2>Your Very Own Listings!</h2>
                                    <p> These are listings that you own! To take down a listing, go to its page and press "remove listing"! </p>
                                </c:when>
                                <c:when test = "${filter =='history'}">
                                    <h2>Your Viewing History</h2>
                                    <p> These are your most recently viewed listings." </p>
                                </c:when>

                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!--? Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-4 ">
                        <!-- Job Category Listing start -->
                        <div class="category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                                <!-- Select City items start -->

                                <!--  Select City items End-->
                                <!-- Select State items start -->
                                <!--  Select km items End-->
                                <!-- Select km items start -->
                                <div class="select-job-items2">
                                    <div class="btn" style="display:block; margin-top: 30px">
                                        <a href="${pageContext.request.contextPath}/profile?filter=postings"><i class="fas fa-search"></i>Your Posted Listings</a>
                                    </div>
                                </div>
                                    <div class="select-job-items2">
                                        <div class="btn" style="width: 100%; display:block;  margin-top: 30px">
                                            <a href="${pageContext.request.contextPath}/profile?filter=favorites"><i class="fas fa-search"></i>Your Favorites</a>
                                        </div>
                                    </div>
                                    <div class="select-job-items2">
                                        <div class="btn" style="max-width: 100%;  margin-top: 30px">
                                            <a href="${pageContext.request.contextPath}/profile?filter=history"><i class="fas fa-search"></i>Your Viewing History</a>
                                        </div>
                                    </div>
                                    <div class="select-job-items2">
                                        <div class="btn" style="width: 100%; display:block;  margin-top: 30px">
                                            <a href="/messages"><i class="fas fa-search"></i>Your Messages</a>
                                        </div>
                                    </div>
                                <c:if test="${loggedInUser.isadmin==true}">
                                    <div class="select-job-items2">
                                        <div class="btn" style="display:block; background-color: #04080f; margin-top: 30px">
                                            <a href="${pageContext.request.contextPath}/getProblematicOwners"><i class="fas fa-search"></i>Problematic Owners</a>
                                        </div>
                                    </div>
                                    <div class="select-job-items2">
                                        <div class="btn" style="display:block; background-color: #04080f; margin-top: 30px">
                                            <a href="${pageContext.request.contextPath}/getProblematicListings"><i class="fas fa-search"></i>Problematic Listings</a>
                                        </div>
                                    </div>
                                </c:if>



                                <!--  Select km items End-->
                                <!-- Select km items start -->

                                <!--  Select km items End-->
                            </div>
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!--?  Right content -->
                    <style>

                    </style>
                    <div class="col-xl-9 col-lg-9 col-md-8 ">
                        <div class="row">
                            <!-- Single -->
                            <c:if test="${not empty products}">
                            <c:forEach items="${products}" var="prod">

                            <div class="col-lg-6" style="margin-top: 10px">
                                <div class="single-top-jobs single-top-jobs2 mb-30" style="background-color: #eeeeee; height:100%; box-shadow: 4px 4px 3px">
                                    <div class="services-cap">
                                        <h5 style="padding-left:10px" ><a href="#">${prod.name} | \$${prod.price_per_day}0 a ${prod.price_period}</a></h5>
                                        <div style="padding:10px; width:100%; height:15em">
                                        <img class="fixedImage2" src="${prod.img_url}" style="box-shadow: 0 0 10px; max-width:100%; max-height:100%; height:100%">
                                        </div>
                                        <p style="padding-left:10px"> ${prod.description}</p>
                                        <div style = "position:absolute; bottom:20px">
                                        <a href="/listing?selectedProduct=${prod.id}" class="btn">View Listing</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty products}">
                                <h2 style="margin-top: 20px">No results found for your query...</h2>
                            </c:if>

                        </div>
                        <!--Pagination Start  -->

                    </div>
                </div>
            </div>
        </div>
        <!-- listing-area Area End -->
        <!--? job Post Start -->
        <section class="job-post  pt-top section-bg2">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 ">
                        <div class="single-features mb-40 pt-60">
                            <div class="job-post-banner">
                                <img src="../../assets/img/gallery/job-pos-banner1.png" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>Post a Listing!</h3>
                                <p>Post an Item you want to Rent Out, make sure to put a description and price!</p>
                                <a href="#" class="border-btn">Post an Item to Rent!</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 ">
                        <div class="single-features single-features2 mb-40 pt-60">
                            <div class="job-post-banner">
                                <img src="../../assets/img/gallery/job-pos-banner2.png" alt="">
                            </div>
                            <div class="features-caption">
                                <h3>Browse for listings!</h3>
                                <p>Looking for a house for the weekend? A car to rent? Browse Listings Here!</p>
                                <a href="#" class="border-btn">Browse Listings</a>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        </section>
        <!-- job Post End -->
    </main>

    <footer>
        <div class="footer-wrappper pl-100 pr-100 section-bg" data-background="assets/img/gallery/footer-bg.png">
            <!-- Footer Start-->
            <div class="footer-area footer-padding">
                <div class="container-fluid">
                    <section class="about-area fix">
                        <!--Right Contents  -->
                        <div class="about-img">

                        </div>
                        <!-- left Contents -->
                        <div id="about" class="about-details">
                            <div class="right-caption">
                                <!-- Section Tittle -->
                                <div class="section-tittle mb-20">
                                    <h2>Having a party and need someone to clean up during and after?</h2>
                                </div>
                                <div class="about-more">
                                    <p class="mb-45 pera-bottom">Here at Easy Rent, we allow users to post their houses, cars, boats,
                                        and other such items, however, you can also offer up your own talents! A user can then rent your
                                        services or items for a duration suitable to both parties. This is perfect for people
                                        who are in need of a one-time service!
                                        Explore options by  pressing the button below!</p>
                                    <a href="#" class="btn">Browse Listings!</a>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <!-- footer-bottom area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="footer-border">
                    <div class="row d-flex align-items-center">
                        <div class="col-xl-12 ">
                            <div class="footer-copy-right text-center">
                                <p>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                    All rights reserved | This template is made with <i class="fa fa-heart"
                                                                                        aria-hidden="true"></i> by <a
                                        href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
        </div>
    </footer>

  <!-- Scroll Up -->
  <div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->

<script src="../../assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="../../assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="../../assets/js/popper.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="../../assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="../../assets/js/owl.carousel.min.js"></script>
<script src="../../assets/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="../../assets/js/wow.min.js"></script>
<script src="../../assets/js/animated.headline.js"></script>
<script src="../../assets/js/jquery.magnific-popup.js"></script>

<!-- Date Picker -->
<script src="../../assets/js/gijgo.min.js"></script>
<!-- Nice-select, sticky -->
<script src="../../assets/js/jquery.nice-select.min.js"></script>
<script src="../../assets/js/jquery.sticky.js"></script>
<!-- Progress -->
<script src="../../assets/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="../../assets/js/jquery.counterup.min.js"></script>
<script src="../../assets/js/waypoints.min.js"></script>
<script src="../../assets/js/jquery.countdown.min.js"></script>
<script src="../../assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="../../assets/js/contact.js"></script>
<script src="../../assets/js/jquery.form.js"></script>
<script src="../../assets/js/jquery.validate.min.js"></script>
<script src="../../assets/js/mail-script.js"></script>
<script src="../../assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="../../assets/js/plugins.js"></script>
<script src="../../assets/js/main.js"></script>

</body>
</html>