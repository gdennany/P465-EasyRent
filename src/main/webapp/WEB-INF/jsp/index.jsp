<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Easy Rent | Home</title>
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
    <link rel="stylesheet" href="../../assets/css/animate.min">
    <link rel="stylesheet" href="../../assets/css/animated-headline.css">
    <link rel="stylesheet" href="../../assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../../assets/css/slick.css">
    <link rel="stylesheet" href="../../assets/css/nice-select.css">
    <link rel="stylesheet" href="../../assets/css/easyRent.css">
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
    <c:if test = "${empty username}">
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
                                                <li> <a href="\contact">Contact Us</a></li>
                                                <li> <a href="#about">About</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                    <div class="header-right-btn d-none d-lg-block ml-65">
                                        <a href="${pageContext.request.contextPath}/login-and-registration" class="border-btn">Log In</a>
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
                                    <a href="${pageContext.request.contextPath}/"><img src="../../assets/img/logo/logo.png" alt=""></a>

                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5">
                                <div class="menu-wrapper  d-flex align-items-center justify-content-end">
                                    <!-- Main-menu -->
                                    <div class="main-menu d-none d-lg-block">
                                        <nav>
                                            <ul id="navigation">

                                                <li> <a href="\contact">Contact Us</a></li>
                                                <li> <a href="#about">About</a></li>
                                                <li> <a href="\chat.html">Chat</a></li>
                                                <li><a href="${pageContext.request.contextPath}/profile?filter=favorites">View Profile<img style=" vertical-align:center; position:absolute; margin-left: 20px; border-radius: 50%; bottom:27px; width:62px" src = ${loggedInUser.profilephoto}></a></li>

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
        <!-- Header End -->
    </c:if>
</header>
<!-- header end -->
<main>
    <section style="filter:brightness(50%);">
        <div class="row">
            <div class="column">
                <div class="fadeimages">
                    <img id="boat1"
                         src="https://www.tradeonlytoday.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTcwMzY1MzUwOTI2MzYxODI0/trophy.jpg"
                         alt="boat1" style="width:33.33%; outline-style: solid; outline-width: medium"/>
                    <img id="bike1"
                         src="https://www.annamaria.com/wp-content/uploads/2018/12/Photo-Jul-28-2-30-18-PM.jpg"
                         alt="bike1" style="width:33.33%; outline-style: solid; outline-width: medium"/>
                    <img id="scooter1"
                         src="https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2020/01/i-1-90450211-lime-debuts-a-scooter-for-people-with-disabilities.jpg"
                         alt="scooter1" style="width:33.33%;outline-style: solid; outline-width: medium"/>
                </div>
            </div>
            <div class="column">
                <div class="fadeimages">
                    <img id="house1"
                         src="https://downleahslane.com/wp-content/uploads/2019/10/Legend-Homes-Reed-Brown-pic-768x768.jpg"
                         alt="house1" style="width:33.33%; outline-style: solid; outline-width: medium"/>
                    <img id="house2" src="https://i.pinimg.com/originals/41/fc/27/41fc27c707d5030dea43d46753f5f424.jpg"
                         alt="house2" style="width:33.33%;outline-style: solid; outline-width: medium"/>
                    <img id="house3"
                         src="https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/stock%2Fshutterstock_302680817ed"
                         alt="house3" style="width:33.33%;outline-style: solid; outline-width: medium"/>
                </div>
            </div>
            <div class="column">
                <div class="fadeimages">
                    <img id="car1" src="https://s.abcnews.com/images/Business/mustang-ht-ml-190114_hpMain_1x1_992.jpg"
                         alt="white" style="width:33.33%;outline-style: solid; outline-width: medium;"/>
                    <img id="car2"
                         src="https://i2.cdn.turner.com/money/dam/assets/151019061528-audi-a7-consumer-reports--640x640.jpg"
                         alt="black" style="width:33.33%;outline-style: solid; outline-width: medium"/>
                    <img id="car3"
                         src="https://images.squarespace-cdn.com/content/v1/58f923d1bf629a20ab67fba2/1519341929809-L6QGZELMZWB3WIDTP21Q/ke17ZwdGBToddI8pDm48kBtpJ0h6oTA_T7DonTC8zFdZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PIWkiAYz5ghgEgSGJuDQ4e1ZKXpRdhEMT7SgthRpD0vyIKMshLAGzx4R3EDFOm1kBS/Vinty-Classic-Car-Rental-Self-Drive"
                         alt="red" style="width:33.33%;outline-style: solid; outline-width: medium"/>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Area Start-->
    <div class="slider-area">
        <div class="single-slider slider-height d-flex align-items-center">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <!-- Hero Caption -->
                        <div class="hero__caption">
                            <h1 style= "font-size: 75px; text-shadow: 7px 7px 9px #060a77;">Find a Listing to Rent${username}</h1>
                            <p style= "font-weight:bold; font-size:30px; text-shadow: 3px 3px 0px #060a77;">We've got houses, cars, services, and much more!</p>
                        </div>
                    </div>

                    <div class="col-xl-11 col-lg-12">

                        <!--Hero form -->
                        <form action="${pageContext.request.contextPath}/searchpage" id="searchBox" method="get" class="search-box">
                            <div class="input-form">
                                <input type="text" name = "keywords"
                                       placeholder="What are you looking for?"
                                       class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = 'What are you looking for?'">
                                <!-- icon -->
                                <div class="icon">
                                    <i class="fas fa-pencil-alt"></i>
                                </div>
                            </div>
                            <div class="input-form2">
                                <input id="location-search" type="text" name = "where"
                                       placeholder="Where?"
                                       class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                       onblur="this.placeholder = ' Where? '">

                                <!-- icon -->
                                <div class="icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                            </div>
                            <div class="select-form">
                                <div class="select-itms">
                                    <select name="category" id="select1">
                                        <option value="All Categories">All Categories</option>
                                        <c:forEach items="${categories}" var="cat">
                                            <option value=${cat.cname}>
                                                    ${cat.cname}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="search-form">
                                <a href="javascript:$('#searchBox').submit();"><i class="fas fa-search"></i> Search</a>
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <!--Hero Area End-->
    <!--? Brand Area Start -->
    <section class="top-jobs  section-padding40 fix" style="padding-top:0px">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-xl-4 col-lg-7 col-md-9">
                    <!-- Section Tittle -->
                    <div class="section-tittle text-center mb-80">
                        <h2>Browse top listings!</h2>
                        <p style = "font-size:26px">Below are some great listings we think you might like!</p>
                    </div>
                </div>
            </div>


            <div class="top-job-slider">
                <c:forEach items="${products}" var="prod">
                    <div style="box-shadow: 0 0 5px; background-image: linear-gradient(
                            rgba(0, 0, 0, 0.5),
                            rgba(0, 0, 0, 0.5)
                            ),url(${prod.img_url});  background-size: 100% 100%; background-repeat: no-repeat;
                            height:250px" class="single-top-jobs">

                        <div  class="services-cap">
                            <h1 style="text-shadow: 0px 0px 3px #1a71e3; color:white; font-weight: bold;">${prod.name} | \$${prod.price_per_day}0 a ${prod.price_period}</h1>
                            <p style="font-weight: bold; text-shadow: 0px 0px 3px #1a71e3; color:white;">${prod.short_desc}</p>
                            <a href="${pageContext.request.contextPath}/listing?selectedProduct=${prod.id}" class="btn">Rent Here!</a>
                        </div>

                    </div>
                </c:forEach>
                <!-- Single -->
            </div>
        </div>
    </section>
    <!-- Brand Area End -->
    <!--? Our Services Start -->
    <section class="our-services  section-padding40" style="padding-top: 50px">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <!-- Section Tittle -->
                    <div class="section-tittle text-center mb-80">
                        <h2>Browse from over <span style="color:#367FFF ;"> thousands</span> of items ready to be
                            rented!</h2>
                        <p style="font-size:22px">Whether you want to rent an item for yourself or put up an item to rent, the process is
                            easy!</p>
                    </div>
                </div>
            </div>
            <div class="row no-gutters">
                <div class=" col-lg-4 col-md-6 col-sm-6">
                    <div style="height:100%; background-color: #eeeeee; box-shadow: 0px 0px 3px;" class="single-services"class="single-services">
                        <div class="services-ion">
                            <img style="position:relative" src="../../assets/img/icon/house1.png" alt="">
                        </div>
                        <div class="services-cap">
                            <h5><a href="#">Stays</a></h5>
                            <p>Explore Stays!</p>
                            <a href="${pageContext.request.contextPath}/searchpage?keywords=&where=&category=Stays" class="more-btn">Browse Listings</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-4 col-md-6 col-sm-6">
                    <div style="height:100%; background-color: #eeeeee; box-shadow: 0px 0px 3px;" class="single-services"class="single-services">
                        <div class="services-ion">
                            <img style="position:relative" src="../../assets/img/icon/car1.png" alt="">
                        </div>
                        <div class="services-cap">
                            <h5><a href="#">Vehicles</a></h5>
                            <p>Explore Vehicles</p>
                            <a href="${pageContext.request.contextPath}/searchpage?keywords=&where=&category=Vehicles" class="more-btn">Browse Listings</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-4 col-md-6 col-sm-6">
                    <div style="height:100%;background-color: #eeeeee; box-shadow: 0px 0px 3px;" class="single-services"class="single-services">
                        <div class="services-ion">
                            <img style="position:relative" src="../../assets/img/icon/wrench1.png" alt="">
                        </div>
                        <div class="services-cap">
                            <h5><a href="#">Services</a></h5>
                            <p>Explore services, such as tutoring, cooking, or even temporary butlers!</p>
                            <a href="${pageContext.request.contextPath}/searchpage?keywords=&where=&category=Services" class="more-btn">Browse Listings</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-4 col-md-6 col-sm-6">
                    <div style="height:100%;background-color: #eeeeee; box-shadow: 0px 0px 3px;" class="single-services"class="single-services">
                        <div class="services-ion">
                            <img style="position:relative" src="../../assets/img/icon/app1.png" alt="">
                        </div>
                        <div class="services-cap">
                            <h5><a href="#">Equipment</a></h5>
                            <p>Explore Equipment</p>
                            <a href="${pageContext.request.contextPath}/searchpage?keywords=&where=&category=Equipment" class="more-btn">Browse Listings</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-4 col-md-6 col-sm-6">
                    <div style="height:100%;background-color: #eeeeee; box-shadow: 0px 0px 3px;" class="single-services">
                        <div class="services-ion">
                            <img style="position:relative" src="../../assets/img/icon/services5.svg" alt="">
                        </div>
                        <div class="services-cap">
                            <h5><a href="#">Boats</a></h5>
                            <p>Explore Boats</p>
                            <a href="${pageContext.request.contextPath}/searchpage?keywords=&where=&category=Boats" class="more-btn">Browse Listings</a>
                        </div>
                    </div>
                </div>
                <div class=" col-lg-4 col-md-6 col-sm-6">
                    <div style="height:100%;background-color: #eeeeee; box-shadow: 0px 0px 3px;" class="single-services" class="single-services">
                        <div class="services-ion">
                            <img style="position:relative" src="../../assets/img/icon/services6.svg" alt="">
                        </div>
                        <div class="services-cap">
                            <h5><a href="#">Everything</a></h5>
                            <p>Explore it all! See what we offer!</p>
                            <a href="${pageContext.request.contextPath}/searchpage?keywords=&where=&category=All+Categories" class="more-btn">Browse Listings</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Our Services End -->
    <!--? About Area Start-->
    <section class="about-area fix">
        <!--Right Contents  -->
        <div class="about-img">
            <div class="info-man text-center">


            </div>
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
    <!-- About Area End-->
    <!--? Top Jobs Start -->

    <!-- Top Jobs End -->
    <!--? Want To work 01-->
    <section class="wantToWork-area">
        <div   class="container pt-35">
            <div class="wants-wrapper w-padding2" style="box-shadow: 0 0 3px #000000">
                <div class="row align-items-center justify-content-between">
                    <div class="col-xl-7 col-lg-9 col-md-8">
                        <div class="wantToWork-caption wantToWork-caption2">
                            <h2>Don't just buy, sell!</h2>
                            <p>Make an account and add listings of your own! </p>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 ">
                        <a href="${pageContext.request.contextPath}/postListing" class="btn f-right wantToWork-btn">Post a Listing!</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Want To work End -->
</main>
<footer>
    <div class="footer-wrappper pt-260 pl-100 pr-100 section-bg" data-background="assets/img/gallery/footer-bg.png">
        <!-- Footer Start-->
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
<script src="../../assets/js/maps.js"></script>
<script src="../../assets/js/main.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBB-yPJutBr1dmTT0-ERIQo-teSNaQ8nYI&libraries=places"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script>
	var input = document.getElementById('location-search');
	var options = {
		componentRestrictions: {country: 'us'}
	};

	autocomplete = new google.maps.places.Autocomplete(input, options);
</script>

</body>
</html>