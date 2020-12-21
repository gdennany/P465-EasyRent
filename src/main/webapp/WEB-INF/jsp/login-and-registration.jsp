<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<%-- browser search icon --%>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon"
              type="image/png"
              href="../../assets/img/favicon.ico" >
    <link rel="stylesheet" type="text/css" href="../../assets/css/login-style.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
</head>

<%-- Google OAuth credentials --%>
<head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1022267535656-1vmpo1eu1tvlcecv7evru31b9n46jvar.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<%-- Facebook OAuth credentials --%>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v8.0&appId=667984497449558&autoLogAppEvents=1" nonce="UTYoOW9h"></script>

<script>
    if (!("${signUpResult}" == "")) {
        console.log("should click");
        document.querySelector('.img-btn').classList.toggle('s-signup');
    }
</script>

<input id="successfulForgotPassEmailInput" name="successfulForgotPassEmailInput" type="hidden" value=${successfulForgotPassEmailInput}/>
<input id="passwordReset" name="passwordReset" type="hidden" value=${passwordReset}>
<input id="noAccount" name="noAccount" type="hidden" value=${noAccount}>
<input id="OTP" name="OTP" type="hidden" value=${OTP}>
<input id="successfulOTP" name="successfulOTP" type="hidden" value=${successfulOTP}>

<input id="result" name="result" type="hidden" value=${loginResult}/>
<body>
  <div class="cont">
    <div class="form sign-in">
      <h4>${loginResult}</h4>
      <h2>Sign In</h2>
      <form action="/login-and-registration" id="signInForm" method="post">
        <label>
          <span>Email Address</span>
          <input id="emailInput" name="emailInput" type="email">
        </label>
        <label>
          <span>Password</span>
          <input id="passwordInput" name="passwordInput" type="password">
        </label>
      </form>
      <button class="submit" id="signInButton" type="button">Sign In</button>

      <p class="trigger" href="#forgot-password" name="forgotPass" id="forgotPass">Forgot Password?</p>
      <form action="" id="forgotPassForm" method="post">
        <div class="modal">
            <div class="modal-content">
                <span class="close-button">&times;</span>
                <h2>Forgot your password?<h2>
                <br/>
                <h3>Follow the steps below to reset your account password </h3>
                <br/>
                <span>Please enter your email</span>
                <input id="forgotPassEmailInput" name="forgotPassEmailInput" type="forgotpass">
                <br/>
                <span class="submitForgotPassButton">Submit</span>
            </div>
        </div>
      </form>

      <input id="securityQ1" name="securityQ1" type="hidden" value=${securityQ1}/>
      <input id="securityQ2" name="securityQ2" type="hidden" value=${securityQ2}/>

      <form action="" id="forgotPassFormSecond" method="post">
        <input id="forgotPassEmailInput" name="forgotPassEmailInput" type="hidden" value=${forgotPassEmailInput}>
        <div class="modalSecond">
            <div class="modal-contentSecond">
                <span class="close-buttonSecond">&times;</span>
                <c:choose>
                  <c:when test="${noAccount == '1'}">
                    <h3>There is no EasyRent account with that email.</h3>
                    <br />
                    <h3>Sign up today!</h3>
                  </c:when>
                  <c:when test="${noAccount == '1'}">
                      <h3>There is no EasyRent account with that email.</h3>
                      <br />
                      <h3>Sign up today!</h3>
                  </c:when>
                  <c:when test="${passwordReset == '-2'}">
                    <h2>It looks like you created your account using a third party authorization.</h2>
                    <br/>
                    <h3>Please try logging in using the Google or Facebook authorization methods below.</h3>
                  </c:when>
                  <c:when test="${passwordReset == '-3'}">
                    <h2>Your answers to the security questions were incorrect.</h2>
                    <br/>
                    <h3>Please try again.</h3>
                  </c:when>
                  <c:otherwise>
                    <h2>Forgot your password?<h2>
                    <br/>
                    <h5>Please answer the following security questions you selected while signing up for your EasyRent account.</h5>
                    <br/>
                    <c:choose>
                      <c:when test="${securityQ1 == '0'}">
                        <span>What is your mothers maiden name?</span>
                      </c:when>
                      <c:when test="${securityQ1 == '1'}">
                        <span>What is the name of your first pet?</span>
                      </c:when>
                      <c:when test="${securityQ1 == '2'}">
                        <span>What elementary school did you attend?</span>
                      </c:when>
                      <c:when test="${securityQ1 == '3'}">
                        <span>What is the name of the town you were born?</span>
                      </c:when>
                      <c:when test="${securityQ1 == '4'}">
                        <span>What is the name of the road you grew up on?</span>
                      </c:when>
                      <c:when test="${securityQ1 == '5'}">
                        <span>Where was your first job?</span>
                      </c:when>
                    </c:choose>
                    <input type="securityQ1Answer" id="securityQ1Answer" name="securityQ1Answer" />
                    <br/>
                    <c:choose>
                      <c:when test="${securityQ2 == '0'}">
                        <span>What is your mothers maiden name?</span>
                      </c:when>
                      <c:when test="${securityQ2 == '1'}">
                        <span>What is the name of your first pet?</span>
                      </c:when>
                      <c:when test="${securityQ2 == '2'}">
                        <span>What elementary school did you attend?</span>
                      </c:when>
                      <c:when test="${securityQ2 == '3'}">
                        <span>What is the name of the town you were born?</span>
                      </c:when>
                      <c:when test="${securityQ2 == '4'}">
                        <span>What is the name of the road you grew up on?</span>
                      </c:when>
                      <c:when test="${securityQ2 == '5'}">
                        <span>Where was your first job?</span>
                      </c:when>
                    </c:choose>
                    <input type="securityQ2Answer" id="securityQ2Answer" name="securityQ2Answer" />
                    <br/>
                    <span class="submitForgotPassButtonSecond">Submit</span>
                  </c:otherwise>
                </c:choose>
            </div>
        </div>
      </form>

      <div class="modalThird">
        <div class="modal-contentThird">
          <span class="close-buttonThird">&times;</span>
          <c:choose>
            <c:when test="${passwordReset == '1'}">
              <h2>Successful password reset!</h2>
              <br/>
              <h3>Please check your email. Instructions on how to access your account have been sent to you from easyrentcustomerservice@gmail.com.</h3>
            </c:when>
            <c:when test="${passwordReset == '-1'}">
              <h2>We are sorry, but something went wrong.</h2>
              <br/>
              <h3>We were unsuccessful in creating a new password for you. Please try again.</h3>
            </c:when>
            <c:when test="${passwordReset == '-2'}">
              <h2>It looks like you created your account using a third party authorization.</h2>
              <br/>
              <h3>Please try logging in using the Google or Facebook authorization methods below.</h3>
            </c:when>
            <c:when test="${passwordReset == '-3'}">
              <h2>Your answers to the security questions were incorrect.</h2>
              <br/>
              <h3>Please try again.</h3>
            </c:when>
          </c:choose>
        </div>
      </div>

      <form action="" id="resetOTP" method="post">
              <!-- <input id="forgotPassEmailInput" name="forgotPassEmailInput" type="hidden" value=${forgotPassEmailInput}> -->
          <div class="modalFourth">
              <div class="modal-contentFourth">
                  <span class="close-buttonFourth">&times;</span>
                  <input id="userEmail" name="userEmail" type="hidden" value=${userEmail}>
                  <c:choose>
                      <c:when test = "${successfulOTP == '-1'}">
                        <h4>Those passwords do not match! Please try again.</h4>
                      </c:when>
                      <c:otherwise>
                        <h3>It looks like you are logging in with a One Time Password. Please set your new password below.</h3>
                      </c:otherwise>
                  </c:choose>
                  <br/>
                  <span>New Password</span>
                  <input type="password" id="newPassword" name="newPassword" />
                  <br/>
                  <span>Confirm your new password</span>
                  <input type="password" id="newConfirmPassword" name="newConfirmPassword" />
                  <br/>
                  <span class="submitForgotPassButtonFourth">Submit</span>
              </div>
          </div>
        </form>

      <div class="social-media">
        <ul>
          <%-- Google OAuth sign in Button --%>
          <li>
            <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
          </li>
            <%-- Facecook OAuth Sign in Button --%>
            <li>
              <div class="fb-login-button" data-size="large" data-button-type="login_with"
                data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"
                data-width="" scope="public_profile, email" onlogin="checkLoginState();"> Sign in
              </div>
            </li>
        </ul>
      </div>
    </div>

    <%-- form to submit on Google OAuth Log in/Sign up attempt --%>
    <form action="/login-and-registration" id="googleSignInForm" method="post">
      <input type="email" name="gmail" id="gmail" />
      <input type="password" name="gname" id="gname" />
    </form>

    <%-- form to submit on Google OAuth Log in/Sign up attempt --%>
    <form action="/login-and-registration" id="facebookSignInForm" method="post">
      <input type="email" name="fmail" id="fmail" />
      <input type="password" name="fname" id="fname" />
    </form>

    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>New here?</h2>
          <p>Sign up and find the rental of your dreams!</p>
        </div>
        <div class="img-text m-in">
          <h2>Already a member?</h2>
          <p>If you already have an account, just sign in.</p>
        </div>
        <div class="img-btn">
          <span class="m-up">Sign Up</span>
          <span class="m-in">Sign In</span>
        </div>
      </div>
      <h6>
        <div class="form sign-up">
          <h4>${signUpResult}</h4>
          <h2>Sign Up</h2>
          <form action="/sign-up" id="signUpForm" method="post">
            <label>
              <span>Name</span>
              <input type="text" id="name" name="name">
            </label>
            <label>
              <span>Email</span>
              <input type="email" id="email" name="email">
            </label>
            <label>
              <span>Password</span>
              <input type="password" id="password" name="password">
            </label>
            <label>
              <span>Confirm Password</span>
              <input type="password" id="confirmPassword" name="confirmPassword">
            </label>
            <label>
              <select name="securityQ1SignUp" id="securityQ1SignUp">
                <option value=-1>SELECT A SECURITY QUESTION</option>
                <option value=0>What is your mothers maiden name?</option>
                <option value=1>What is the name of your first pet?</option>
                <option value=2>What elementary school did you attend?</option>
                <option value=3>What is the name of the town you were born?</option>
                <option value=4>What is the name of the road you grew up on?</option>
                <option value=5>Where was your first job?</option>
              </select>
              <input type="securityQ1AnswerSignUp" id="securityQ1AnswerSignUp" name="securityQ1AnswerSignUp">
            </label>
            <label>
              <select name="securityQ2SignUp" id="securityQ2SignUp">
                <option value=-1>SELECT A SECURITY QUESTION</option>
                <option value=0>What is your mothers maiden name?</option>
                <option value=1>What is the name of your first pet?</option>
                <option value=2>What elementary school did you attend?</option>
                <option value=3>What is the name of the town you were born?</option>
                <option value=4>What is the name of the road you grew up on?</option>
                <option value=5>Where was your first job?</option>
              </select>
              <input type="securityQ2AnswerSignUp" id="securityQ2AnswerSignUp" name="securityQ2AnswerSignUp">
            </label>
          </form>
          <button type="button" id="signUpButton" class="submit">Sign Up Now</button>
        </div>
      </h6>
    </div>
  </div>
<script type="text/javascript" src="../../assets/js/login-script.js"></script>
</body>

</html>