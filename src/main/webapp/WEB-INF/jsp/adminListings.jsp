<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Easy Rent | Making Renting Easy</title>
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
    <link rel="stylesheet" href="../../assets/css/easyRent.css">
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
    <c:if test="${empty username}">
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
                                            <ul id="navigation2">
                                                <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                                                <li><a href="#about">About</a></li>

                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                    <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="${pageContext.request.contextPath}/login-and-registration"
                                           class="border-btn">Log In</a>
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
    </c:if>
    <c:if test="${not empty username}">
        <div class="header-area header-transparent">
            <div class="main-header ">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-5 col-lg-5">
                                <div class="logo" style="
                        position: relative;
                        bottom: 20px;
                            right: 90px;">
                                    <a href="${pageContext.request.contextPath}/"><img
                                            src="../../assets/img/logo/logo.png" alt=""></a>

                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5">
                                <div class="menu-wrapper  d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">

                                                <li><a href="login-and-registration">Contact Us</a></li>
                                                <li><a href="${pageContext.request.contextPath}/#about">About</a></li>
                                                <li> <a href="${pageContext.request.contextPath}/chat.html">Chat</a></li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/profile?filter=favorites">View
                                                        Profile<img
                                                                style=" vertical-align:center; position:absolute; margin-left: 20px; border-radius: 50%; bottom:27px; width:62px"
                                                                src= ${loggedInUser.profilephoto}></a></li>

                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->


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
    </c:if>
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
                            <h1>Admin Dashboard </h1>
                        </div>
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
                    <div class="section-tittle mb-50" style="position:relative; left:40%">
                        <h2>What is a problem listing?</h2>
                        <p> These listing are some of the more "problematic" on our website. Listings that
                            have an average rating of 3 stars and below can be found here.</p>
                        <br>
                        <br>
                        <br>
                        <h2 style="position:relative;"> Problematic Listings</h2>
                    </div>
                </div>
            </div>
        </div>
        <!--?  Right content -->
        <!-- Single -->

        <c:if test="${not empty products}">
            <c:forEach items="${products}" var="prod">

                <div class="top-jobs mb-50">
                    <!-- Single -->
                    <div class="single-top-jobs" style="background-color: #eeeeee;  box-shadow: 0px 0px 3px;  width:50%; position:relative; left:25%;text-align:center"">
                        <div class="services-cap">
                            <img style=" box-shadow: 0px 0px 3px; position:relative; margin-bottom: 30px; max-width: 100%"
                                 src=${prod.img_url}>
                            <h5><a href="#">${prod.name}  | \$${prod.price_per_day}0 a ${prod.price_period}</a></h5>
                            <p>${prod.description}</p>

                        </div>

                        <div style = "position:relative;   margin-top: 50px; bottom:20px">
                            <a href="\listing?selectedProduct=${prod.id}" class="btn">View Listing</a>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty products}">
            <h2 style="margin-top: 20px">No problematic listings found...</h2>
        </c:if>

    </div>



    <!--Pagination Start  -->

    <!--Pagination End  -->



    <!-- listing-area Area End -->

    <footer>
        <div class="footer-wrappper pt-260 pl-100 pr-100 section-bg" data-background="assets/img/gallery/footer-bg.png">
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
                                    <p class="mb-45 pera-bottom">Here at Easy Rent, we allow users to post their houses,
                                        cars, boats,
                                        and other such items, however, you can also offer up your own talents! A user
                                        can then rent your
                                        services or items for a duration suitable to both parties. This is perfect for
                                        people
                                        who are in need of a one-time service!
                                        Explore options by pressing the button below!</p>
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
    <div id="back-top">
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
    <script>
		var switchimage = "heart2";

		function like() {
			var image = document.getElementById('heart2');
			if (switchimage == "heart2") {
				image.src = "assets/img/gallery/Heart.png";
				switchimage = "heart1";
			} else {
				image.src = "assets/img/gallery/Heart2.png";
				switchimage = "heart2"
			}

		}
    </script>
</body>

</html>