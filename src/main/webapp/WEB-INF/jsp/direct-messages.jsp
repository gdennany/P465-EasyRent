<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>EasyRent | Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/messages-style.css">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/hamburgers.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../assets/css/contact-style.css">
</head>
<!--? Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="assets/img/logo/loder.png" alt="">
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
                            <h1>Message other users here</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Hero Area End-->

<!--
<c:forEach items="${messageThread}" var="message">
<p>${message.value[0]}</p>
</c:forEach>
-->

<input id="allMessages" name="allMessages" type="hidden" value=${allMessages}>

<div style="display: none;" id="allMessageHistory">
    <ul name="messageHistory" id="messageHistory">
        <c:forEach items="${allMessages}" var="message">
             <li>${message.key}123xyz964${message.value[0]}123xyz964${message.value[1]}123xyz964${message.value[2]}123xyz964${message.value[3]}</li>
        </c:forEach>
    </ul>
</div>

<input id="messagePreviews" name="messagePreviews" type="hidden" value=${messagePreviews}>

<div style="display: none;" id="messagePreviewHistory">
    <ul name="hiddenMessagePreviewList" id="hiddenMessagePreviewList">
        <c:forEach items="${messagePreviews}" var="preview">
             <li>${preview.key}123xyz964${preview.value[0]}123xyz964${preview.value[1]}123xyz964${preview.value[2]}</li>
        </c:forEach>
    </ul>
</div>

    <!--?  Messages Area start  -->
    <section class="message-section" >
        <div class="container" tabindex="0" >

        <input id="userMessages" name="userMessages" type="hidden" value=${userMessages}>

        <!--
        <input id="messagePreviews" name="messagePreviews" type="hidden" value=${messagePreviews}>
        <input id="messageStatus" name="messageStatus" type="hidden" value=${messageStatus}>
        <input id="messageTimeAgo" name="messageTimeAgo" type="hidden" value=${messageTimeAgo}>
        -->

        <input id="firstMessageInList" name="firstMessageInList" type="hidden" value=${firstMessageInList}>
        <input id="messageThread" name="messageThread" type="hidden" value=${messageThread}>
        <input id="userDirectory" name="userDirectory" type="hidden" value=${userDirectory}>

        <body>
        	<div class="main-section">
        		<div class="head-section">
        			<div class="headLeft-section">
        				<div onload ="getUser()" class="headLeft-sub">
                            <c:if test = "${ empty who}">
        					    <input type="text" id="searchInput" name="searchInput" placeholder="Search">
                            </c:if>
                            <c:if test = "${ not empty who}">
                                <input type="text" id="searchInput" name="searchInput" value=${who}>
                                <script>
                                    function getUser(){
                                    	document.getElementById(searchInput).value=${who};
                                    	document.getElementById(search).click();
                                    	alert("hi");
                                    }
                                </script>
                            </c:if>
        					<button id = "search" class="search"> <i class="fa fa-search"></i> </button>
        				</div>
        			</div>
        			<div class="headRight-section">
        				<div class="headRight-sub">
        					<h3 id="previewTitle">Lajy Ion</h3>
        					<small id="previewMessage">Lorem ipsum dolor sit amet...</small>
        				</div>
        			</div>
        		</div>
        		<div class="body-section">

        			<!-- start message preview left section -->
        			<div class="left-section mCustomScrollbar" id="messageHeaders" data-mcs-theme="minimal-dark"
        			     onmouseover="document.body.style.overflow='hidden';" onmouseout="document.body.style.overflow='auto';">

        				<ul class="messagePreviewList" id="messagePreviewList" name="messagePreviewList">
        				    <c:forEach begin="0" end="100" varStatus="loop">
        				        <li style="display: none;">
                                    <div class="chatList">
                                        <div class="img">
                                            <i id="unreadIdentifier" class="fa fa-circle"></i>
                                            <img src="../../assets/img/sample_avatar2.png">
                                        </div>
                                        <div class="desc">
                                            <small class="time">""</small>
                                            <h5 name="senderName" id="senderName">""</h5>
                                            <small>""</small>
                                        </div>
                                    </div>
                                </li>
        				    </c:forEach>
        				<!--
        					<c:forEach items="${messagePreviews}" var="messagePreview">
        					    <c:forEach items="${messageStatus}" var="messageStatus">
        					        <c:forEach items="${messageTimeAgo}" var="messageTimeAgo">
                                    <c:if test="${messagePreview.key == messageStatus.key and messagePreview.key == messageTimeAgo.key}">
                                        <li>
                                            <div class="chatList">
                                                <div class="img">
                                                    <c:choose>
                                                        <c:when test="${messageStatus.value}">
                                                            <i id="unreadIdentifier" class="fa fa-circle"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i id="unreadIdentifier" class=""></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <img src="../../assets/img/sample_avatar1.png">
                                                </div>
                                                <div class="desc">
                                                    <small class="time">${messageTimeAgo.value}</small>
                                                    <h5 name="senderName" id="senderName">${messagePreview.key}</h5>
                                                    <small>${messagePreview.value}</small>
                                                </div>
                                            </div>
                                        </li>
                                    </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                         -->
        				</ul>
        			</div>

        			<!-- end message preview left section -->

        			<!-- start messages between users right section -->

        			<div class="right-section">
        				<div class="message mCustomScrollbar" id="messageHistory" data-mcs-theme="minimal-dark"
        				    onmouseover="document.body.style.overflow='hidden';" onmouseout="document.body.style.overflow='auto';">
        					<ul name="messages" id="messages">
        						<c:forEach begin="0" end="150" varStatus="loop">
                                    <li class="msg-left" style="display: none;">
                                       <div class="msg-left-sub" >
                                            <img id="imgId" src="../../assets/img/sample_avatar2.png">
                                            <div class="msg-desc">""</div>
                                            <small class="smallClass">""</small>
                                        </div>
                                    </li>
                                </c:forEach>
        					</ul>
        				</div>

        				<div class="right-section-bottom">
                            <input type="hidden" name="recipient" value="" id="recipient" />
                            <div class="upload-btn">
                                <!-- below commented out part is for uploading a photo as a message
                                <button class="btn"><i class="fa fa-photo"></i></button>
                                <input type="file" name="myfile" />  -->
                            </div>
                            <input type="text" name="userInput" id="userInput" placeholder="type here">
                            <button class="btn-send"><i class="fa fa-send"></i></button>
        				</div>
        			</div>

        			<!-- end messages between users right section -->

        		</div>
        	</div>

        	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        	<!-- custom scrollbar plugin -->
        	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
        	<script type="text/javascript" src="../../assets/js/messages-script.js"></script>
          </div >

        </section >
        </body>

    <!-- Contact Area End -->



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
                                   <a href="/"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
                               </div>
                               <!-- social -->
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-3 col-md-4 col-sm-5">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Top categories</h4>
                               <ul>
                                   <li><a href="#">Design & creatives</a></li>
                                   <li><a href="#">Telecommunication</a></li>
                                   <li><a href="#">Restaurant</a></li>
                                   <li><a href="#">Programing</a></li>
                                   <li><a href="#">Architecture</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>For employer</h4>
                               <ul>
                                   <li><a href="#">Design & creatives</a></li>
                                   <li><a href="#">Telecommunication</a></li>
                                   <li><a href="#">Restaurant</a></li>
                                   <li><a href="#">Programing</a></li>
                                   <li><a href="#">Architecture</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>Company</h4>
                               <ul>
                                   <li><a href="#">Design & creatives</a></li>
                                   <li><a href="#">Telecommunication</a></li>
                                   <li><a href="#">Restaurant</a></li>
                                   <li><a href="#">Programing</a></li>
                                   <li><a href="#">Architecture</a></li>
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
                                       class="email_icon newsletter-submit button-contactForm"><img src="assets/img/gallery/form.png" alt=""></button>
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
                           <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                              Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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

<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="./assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="./assets/js/owl.carousel.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<!-- One Page, Animated-HeadLin -->
<script src="./assets/js/wow.min.js"></script>
<script src="./assets/js/animated.headline.js"></script>
<script src="./assets/js/jquery.magnific-popup.js"></script>

<!-- Date Picker -->
<script src="./assets/js/gijgo.min.js"></script>
<!-- Nice-select, sticky -->
<script src="./assets/js/jquery.nice-select.min.js"></script>
<script src="./assets/js/jquery.sticky.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="./assets/js/jquery.counterup.min.js"></script>
<script src="./assets/js/waypoints.min.js"></script>
<script src="./assets/js/jquery.countdown.min.js"></script>
<script src="./assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="./assets/js/contact.js"></script>
<script src="./assets/js/jquery.form.js"></script>
<script src="./assets/js/jquery.validate.min.js"></script>
<script src="./assets/js/mail-script.js"></script>
<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->
<script src="./assets/js/plugins.js"></script>
<script src="./assets/js/main.js"></script>
<script type="text/javascript" src="../../assets/js/contact-script.js"></script>

</body>
</html>