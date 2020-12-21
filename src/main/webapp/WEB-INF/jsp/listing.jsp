<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Easy Rent | Details</title>
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
                                                <li> <a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
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

                                            <li> <a href="login-and-registration">Contact Us</a></li>
                                            <li> <a href="about">About</a></li>
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
                            <h1>Item Details</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Hero Area End-->
    <!-- job post company Start -->
    <div class="job-post-company pt-120 pb-120">
        <div class="container">
            <div class="row justify-content-between">
                <!-- Left Content -->
                <div class="col-xl-7 col-lg-8">
                    <div class="top-jobs mb-50">
                        <!-- Single -->
                        <div class="single-top-jobs" style="background-color: #eeeeee;  box-shadow: 0px 0px 3px">
                            <div class="services-cap">
                                <img style=" box-shadow: 0px 0px 3px; position:relative; margin-bottom: 30px; max-width: 100%"
                                     src=${obj.img_url}>
                                <h5><a href="#">${obj.name}</a></h5>
                                <p>${obj.description}</p>

                            </div>

                        </div>
                    </div>

                    <div class="job-post-details">
                        <div class="post-details1 mb-50">
                            <!-- Small Section Tittle -->

                        </div>
                        <div style="background-color: #eeeeee;  box-shadow: 0px 0px 3px">
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle pt-20">
                                    <h4>Read Reviews</h4>
                                </div>
                                <c:if test="empty ${prodReviews}">
                                    <p> This item has no reviews... </p>
                                    <a href="${pageContext.request.contextPath}/review?product=${obj.id}" style="margin-top: 20px; width:100%; color: white;" class="btn"><strong>Leave a Review</strong></a>

                                </c:if>
                                <ul style="padding-bottom: 20px">
                                    <c:forEach items = "${prodReviews}" var = "review">
                                    <p style="text-align: left"><strong>Rating: </strong>${review.rating}/5 :<br> <strong>Comment: </strong>"${review.review}"
                                    </p>
                                    </c:forEach>
                                </ul>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- Right Content -->
                <div class="col-xl-4 col-lg-4">
                    <div class="post-details3  mb-50" style="background-color: #eeeeee;  box-shadow: 0px 0px 3px">
                        <!-- Small Section Tittle -->
                        <div class="small-section-tittle">
                            <h4>Item Overview</h4>
                        </div>
                        <ul>
                            <li>Posted date : <span>12 Aug 2019</span></li>

                            <li>Length of Rent : <span>1 - 4 days</span></li>
                            <li>Price : <span>\$${obj.price_per_day}0 a ${obj.price_period}</span></li>
                            <li><span style="display: inline-block; text-align: center">Location : </span></li>
                            <li><span style="text-align: center" id="myspan"></span></li>

                        </ul>
                        <div class="apply-btn2">
                            <iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>
                            <c:if test="${obj.owner == loggedInUser.id || loggedInUser.isadmin == true}">
                                <a href="${pageContext.request.contextPath}/removeListing?product=${obj.id}" style="width:100%; color: white; margin-bottom: 20px" class="btn"><strong>Remove
                                    Listing</strong></a>
                            </c:if>
                            <c:if test="${obj.owner != loggedInUser.id}">

                                <a href="${pageContext.request.contextPath}/messages?who=${obj.owner}" style="width:100%; color: white;" class="btn"><strong>Contact Owner</strong></a>
                                <a href="${pageContext.request.contextPath}/review?product=${obj.id}" style="margin-top: 20px; width:100%; color: white;" class="btn"><strong>Leave a Review</strong></a>
                                <form id="favorite" method="post"
                                      action="${pageContext.request.contextPath}/addFavorite">
                                    <c:choose>
                                        <c:when test="${isUserFavorite=='yes'}">
                                            <button name="favorite" value="remove"
                                                    style="background:black; color: white; margin-top: 20px; width:100%"
                                                    class="btn" id="addToFavorites" onclick="addToFavorites()"><strong>Remove
                                                From Favorites</strong></button>

                                        </c:when>
                                        <c:otherwise>
                                            <button name="favorite" value="add"
                                                    style="color: white; margin-top: 20px; width:100%" class="btn"
                                                    id="addToFavorites" onclick="addToFavorites()"><strong>Add to
                                                Favorites</strong></button>

                                        </c:otherwise>
                                    </c:choose>
                                    <input type="hidden" name="product" value="${obj.id}">
                                </form>
                            </c:if>

                            <script>
								function addToFavorites() {

									if (document.getElementById("addToFavorites").innerText === "Add To Favorites") {
										document.getElementById("addToFavorites").textContent = "Remove From Favorites";
										document.getElementById("addToFavorites").style.background = "black";
										document.getElementById("addToFavorites").style.fontWeight = "bold";
										document.getElementById("addToFavorites").setAttribute("value", "add");
										document.getElementById("favorite").submit();

									} else {
										document.getElementById("addToFavorites").textContent = "Add To Favorites";
										document.getElementById("addToFavorites").style.background = "#367FFF";
										document.getElementById("addToFavorites").style.fontWeight = "bold";
										document.getElementById("addToFavorites").setAttribute("value", "remove");
										document.getElementById("favorite").submit();
									}


								}
                            </script>
                        </div>
                    </div>
                    <div class="post-details4  mb-50" style="background-color: #eeeeee; box-shadow: 0px 0px 3px">
                        <!-- Small Section Tittle -->
                        <div class="small-section-tittle">
                            <h4 style="padding-top: 20px">Owner Information</h4>
                        </div>
                        <span><img src="../../assets/img/gallery/profile.png"></span>
                        <ul>
                            <li>Name: <span>${user.username}</span></li>
                            <c:if test="${averageRating == 0}">
                                This user does not have any ratings...
                            </c:if>
                            <c:if test="${averageRating != 0}">
                            <li>Average Rating: ${averageRating}/5 </li>
                            </c:if>
                            <li>Number of times Rented: <span> This user has rented out ${userRentCount} items!</span>
                            </li>
                            <li>Email: <span>${user.email}</span></li>
                            <a href="${pageContext.request.contextPath}/complaint?userId=${user.id}&username=${user.username}" style="margin-top: 20px; margin-bottom: 20px; width:80%; color: white;" class="btn"><strong>File a Complaint</strong></a>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- job post company End -->


    <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBB-yPJutBr1dmTT0-ERIQo-teSNaQ8nYI&callback=initialize&libraries=&v=weekly"
            defer
    ></script>
    <style type="text/css">
        /* Set the size of the div element that contains the map */
        #map {
            margin-top: 10px;
            margin-bottom: 10px;
            height: 500px;
            /* The height is 400 pixels */
            width: 75%;
            /* The width is the width of the web page */
            position: relative;
            left: 50%;
            transform: translateX(-50%);

        }
    </style>
    <script>
		var geocoder;
		var map;

		function initialize() {
			geocoder = new google.maps.Geocoder();
			var latlng = new google.maps.LatLng(-34.397, 150.644);
			var mapOptions = {
				zoom: 8,
				center: latlng
			}
			map = new google.maps.Map(document.getElementById('map'), mapOptions);
			codeAddress();
			convertPlaceIDToFormattedAddress()
		}

		function codeAddress() {
			var address = "${obj.location}";
			geocoder.geocode({'placeId': address}, function(results, status) {
				if (status == 'OK') {
					map.setCenter(results[0].geometry.location);
					var marker = new google.maps.Marker({
						map: map,
						position: results[0].geometry.location
					});
					document.getElementById("myspan").textContent = results[0].formatted_address;
				} else {
					alert('Geocode was not successful for the following reason: ' + status);
				}
			});
		}


    </script>


    <!--The div element for the map -->

    <div id="map" onload="codeAddress()"></div>


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
<div id="back-top">
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
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