<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="no-js" lang="zxx">

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBB-yPJutBr1dmTT0-ERIQo-teSNaQ8nYI&libraries=places"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Easy Rent | Making Renting Easy!</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="../../assets/img/favicon.ico">

  <!-- CSS here -->
  <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="../../assets/css/slicknav.css">
  <link rel="stylesheet" href="assets/css/animate.min.css">
  <link rel="stylesheet" href="../../assets/css/hamburgers.min.css">
  <link rel="stylesheet" href="../../assets/css/magnific-popup.css">
  <link rel="stylesheet" href="../../assets/css/fontawesome-all.min.css">
  <link rel="stylesheet" href="../../assets/css/themify-icons.css">
  <link rel="stylesheet" href="../../assets/css/slick.css">
  <link rel="stylesheet" href="../../assets/css/nice-select.css">
  <link rel="stylesheet" href="../../assets/css/style.css">
</head>

<body>
  <!--? Preloader Start -->
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
                                                  <li> <a href="\chat.html">Chat</a></li>
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
                <h1>Post a Listing</h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--Hero Area End-->
    <!--? Start Align Area -->
    <div class="whole-wrap">
      <div class="container box_1170">
        
        <div class="section-top-border">
          <div class="row">
            <div class="col-lg-8 col-md-8">
              <h3 class="mb-30">Fill Out This Form to Post a Listing!</h3>
              <form name="myform" action="${pageContext.request.contextPath}/addListing" method="post">
                <div class="mt-10">
                  <input style="box-shadow: 0 0 3px #000000" type="text" name="name" placeholder="Listing Title" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Listing Title'" required class="single-input">
                </div>
                
                <div class="mt-10">
                  <input style="box-shadow: 0 0 3px #000000" type="text" name="short_desc" placeholder="Short Description [Tagline]" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Short Description'" required class="single-input">
                </div>
                  <div class="mt-10">
                  <textarea style="box-shadow: 0 0 3px #000000" class="single-textarea"  name= "description" placeholder="Item Description" onfocus="this.placeholder = ''"
                            onblur="this.placeholder = 'Item Description'" required></textarea>
                  </div>

                <div class="input-group-icon mt-10">
                  <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                  <input style="box-shadow: 0 0 3px #000000" type="text" id="location-search" name="city" placeholder="Address" onfocus="this.placeholder = ''"
                    onblur="this.placeholder = 'Address'" required class="single-input">
                    <input id = "address" type = 'hidden' name = 'address'>
                </div>

                  <script>
					  var input = document.getElementById('location-search');
					  var options = {
						  componentRestrictions: {country: 'us'}
					  };

					  autocomplete = new google.maps.places.Autocomplete(input, options);

                      function codeAddress() {
                      	var geocoder = new google.maps.Geocoder();
						  var address = document.getElementById('location-search').value;
						  geocoder.geocode( { address: address}, function(results, status) {
							  if (status === 'OK') {
								  document.getElementById("address").value=results[0].place_id;
                                  document.myform.submit();
							  } else {
								  alert('Geocode was not successful for the following reason: ' + status);
							  }
						  })}
                  </script>

                <div class="mt-10 mb-20">
                    <label for="select1" style="font-weight: bold; margin-left: 10px; position: relative; top:5px"> (Select a Category) </label>
                    <select id="select1" class="mb-20" name="category" style ="display:inline-block; width:100%; box-shadow: 0 0 3px #000000">
                        <option value="Stays">Stays</option>
                        <option value="Equipment">Equipment</option>
                        <option value="Services">Services</option>
                        <option value="Vehicles">Vehicles</option>
                        <option value="Bikes">Bikes</option>
                    </select>

                </div>
                  <div class="mt-10">
                      <input style="box-shadow: 0 0 3px #000000" type="text" name="condition" placeholder="Condition/Experience" onfocus="this.placeholder = ''"
                             onblur="this.placeholder = 'Condition/Experience'" required class="single-input">
                  </div>
                  <div class="row mt-10" >
                      <div class="col-xs-4" style="margin-left:14px">
                          <input style="box-shadow: 0 0 3px #000000"  type="number" name="price" placeholder="Price" onfocus="this.placeholder = ''"
                                 onblur="this.placeholder = '$'" required class="single-input">
                      </div>
                      <div class="col-xs-4">
                         <p style="width:100%; margin-left: 40px; margin-right:40px; font-size:24px">per</p>
                      </div>
                      <div class="col-xs-4">
                          <select name="period" style ="display:inline-block; width:100%; box-shadow: 0 0 3px #000000">
                              <option value="hour">hour</option>
                              <option value="day">day</option>
                              <option value="week">week</option>
                              <option value="month">month</option>
                              <option value="year">year</option>
                          </select>
                      </div>
                  </div>


                  <div class="mt-10">
                      <!--  <label for="picture"> Upload a Picture</label>
                    <input type="file"
                        id="avatar" name="avatar"
                        accept="image/png, image/jpeg"> -->
                      <input style="box-shadow: 0 0 3px #000000"  type="url" name="img_url" placeholder="Image URL" onfocus="this.placeholder = ''"
                             onblur="this.placeholder = 'Image URL'" required class="single-input">

                </div>
                <button onclick = "codeAddress()" class="genric-btn primary mt-10" >Submit</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- End Align Area -->
    
  </main>
  <footer>
    <div class="footer-wrappper pl-100 pr-100 section-bg" data-background="assets/img/gallery/footer-bg.png">
       <!-- Footer Start-->
       <div class="footer-area footer-padding">
           <div class="container-fluid">
               <div class="row">
                   <div class="col-xl-3 col-lg-5 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                           <div class="single-footer-caption mb-30">
                               <!-- logo -->
                               <div class="footer-logo mb-25">
<<<<<<< HEAD
                                   <a href="${pageContext.request.contextPath}/"><img src="../../assets/img/logo/logo2_footer.png" alt=""></a>
=======
                                   <a href="../../index.jsp"><img src="../../assets/img/logo/logo2_footer.png" alt=""></a>
>>>>>>> 330026e6f2c573a39f137b402b651024931b64db
                               </div>
                               <div class="footer-tittle">
                                   <div class="footer-pera">
                                       <p>We make renting easy!</p>
                                   </div>
                               </div>
                               <!-- social -->
                               <div class="footer-social">
                                   <a href="#"><i class="fab fa-twitter"></i></a>
                                   <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                   <a href="#"><i class="fab fa-pinterest-p"></i></a>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Top categories</h4>
                               <ul>
                                   <li><a href="#">Homes</a></li>
                                   <li><a href="#">Cars</a></li>
                                   <li><a href="#">Tutors</a></li>
                                   <li><a href="#">Boats</a></li>
                                   <li><a href="#">Bikes</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Top Cities</h4>
                               <ul>
                                   <li><a href="#">New York</a></li>
                                   <li><a href="#">Chicago</a></li>
                                   <li><a href="#">Los Angeles</a></li>
                                   <li><a href="#">Orlando</a></li>
                                   <li><a href="#">Miami</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Contact</h4>
                               <ul>
                                   <li><a href="#">Careers</a></li>
                                   <li><a href="#">Leave a Review</a></li>
                                   <li><a href="#">Contact Us</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle mb-50">
                               <h4>Subscribe newsletter</h4>
                               <p>Subscribe newsletter to get updates.</p>
                           </div>
                           <!-- Form -->
                           <div class="footer-form" >
                               <div id="mc_embed_signup">
                                   <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                   method="get" class="subscribe_form relative mail_part">
                                   <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                   class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                   onblur="this.placeholder = ' Email Address '">
                                   <div class="form-icon">
                                       <button type="submit" name="submit" id="newsletter-submit"
                                       class="email_icon newsletter-submit button-contactForm"><img src="../../assets/img/gallery/form.png" alt=""></button>
                                   </div>
                                   <div class="mt-10 info"></div>
                               </form>
                           </div>
                       </div>
                   </div>
               </div>
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
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is
                    made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com"
                      target="_blank">Colorlib</a>
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