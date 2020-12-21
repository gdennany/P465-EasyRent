document.querySelector('.img-btn').addEventListener('click', function() {
    document.querySelector('.cont').classList.toggle('s-signup')
});

document.getElementById('signInButton').addEventListener('click', function() {
    var emailInput = document.getElementById("emailInput");
    var passwordInput = document.getElementById("passwordInput");

    if (emailInput.value == '' || passwordInput.value == '') {
        console.log("Please fill out all fields");
    } else {
        document.getElementById("signInForm").submit();
    }
});


document.getElementById('signUpButton').addEventListener('click', function() {
    var name = document.getElementById("name");
    var email = document.getElementById("email");
    var password = document.getElementById("password");
    var confirmPassword = document.getElementById("confirmPassword");
    var securityQ1 = document.getElementById("securityQ1SignUp");
    var securityQ2 = document.getElementById("securityQ2SignUp");

    var securityQ1Ans = document.getElementById("securityQ1AnswerSignUp");
    var securityQ2Ans = document.getElementById("securityQ2AnswerSignUp");

    console.log(securityQ1.value);
    console.log(securityQ2.value);
    console.log(securityQ1Ans.value);
    console.log(securityQ2Ans.value);

    if (name.value == '' || email.value == '' || password.value == '' || confirmPassword.value == '' || securityQ1.value == -1 || securityQ2.value == -1
           || securityQ1Ans.value == '' || securityQ2Ans.value == '' || securityQ1.value == securityQ2.value) {
        console.log("Please fill out all fields");
    } else {
        document.getElementById("signUpForm").submit();
    }
});


// below block handles modal popups
var modal = document.querySelector(".modal");
var trigger = document.querySelector(".trigger");
var closeButton = document.querySelector(".close-button");
var submitButton = document.querySelector(".submitForgotPassButton");
var submitButtonSecond = document.querySelector(".submitForgotPassButtonSecond");
var forgotPassSub = document.getElementById("successfulForgotPassEmailInput");
var passwordReset = document.getElementById("passwordReset");
var OTP = document.getElementById("OTP");

var modalSecond = document.querySelector(".modalSecond");
var closeButtonSecond = document.querySelector(".close-buttonSecond");
var submitButtonSecond = document.querySelector(".submitForgotPassButtonSecond");

var modalThird = document.querySelector(".modalThird");
var closeButtonThird = document.querySelector(".close-buttonThird");

var modalFourth = document.querySelector(".modalFourth");
var closeButtonFourth = document.querySelector(".close-buttonFourth");
var submitButtonFourth = document.querySelector(".submitForgotPassButtonFourth");

//This is true when the user has submitted a valid email into the forgot my password first dropdown modal
if (forgotPassSub.value == "1/") {
    modalSecond.classList.toggle("show-modalSecond");
}

if (passwordReset.value == "1" || passwordReset.value == "-1" || passwordReset.value == "-2" || passwordReset.value == "-3") {
    modalThird.classList.toggle("show-modalThird");
}

if (OTP.value == "1") {
    modalFourth.classList.toggle("show-modalFourth");
}

function toggleModal() {
    modal.classList.toggle("show-modal");
}

function toggleModalSecond() {
    modalSecond.classList.toggle("show-modalSecond");
}

function toggleModalThird() {
    modalThird.classList.toggle("show-modalThird");
}

function toggleModalFourth() {
    modalFourth.classList.toggle("show-modalFourth");
}


function windowOnClick(event) {
    if (event.target === modal) {
        toggleModal();
    }
    if (event.target === modalSecond) {
        toggleModalSecond();
    } if (event.target === modalThird) {
        toggleModalThird();
    } if (event.target === modalFourth) {
        toggleModalFourth();
    }
}

trigger.addEventListener("click", toggleModal);
closeButton.addEventListener("click", toggleModal);
closeButtonSecond.addEventListener("click", toggleModalSecond);
closeButtonThird.addEventListener("click", toggleModalThird);
closeButtonFourth.addEventListener("click", toggleModalFourth);
window.addEventListener("click", windowOnClick);
submitButton.addEventListener("click", forgotSubmitButtonClick);
submitButtonSecond.addEventListener("click", forgotSubmitButtonSecondClick);
submitButtonFourth.addEventListener("click", forgotSubmitButtonFourthClick);


function forgotSubmitButtonClick() {
    var emailInput = document.getElementById("forgotPassEmailInput");

    if (emailInput.value == '') {
        console.log("Please fill out all fields");
    } else {
        document.getElementById("forgotPassForm").submit();
        //document.getElementById("signInForm").submit();
    }
}

function forgotSubmitButtonSecondClick() {
    var q1Input = document.getElementById("securityQ1Answer");
    var q2Input = document.getElementById("securityQ2Answer");

    if (q1Input.value == '' || q2Input.value == '') {
        console.log("Please fill out all fields");
    } else {
        document.getElementById("forgotPassFormSecond").submit();
        //document.getElementById("signInForm").submit();
    }
}

function forgotSubmitButtonFourthClick() {
    var newPassword = document.getElementById("newPassword");
    var newConfirmPassword = document.getElementById("newConfirmPassword");

    if (newPassword.value == '' || newConfirmPassword.value == '') {
        console.log("Please fill out all fields");
    } else {
        document.getElementById("resetOTP").submit();
        //document.getElementById("signInForm").submit();
    }
}

document.getElementById("successfulForgotPassEmailInput");




// Below block handles Google Oauth Sign ins

//sign out any pre-logged in google users
window.onbeforeunload = function(e){
  console.log("User signed out");
  gapi.auth2.getAuthInstance().signOut();
};

//here on successful google oauth sign in
function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('Full Name: ' + profile.getName());
      console.log('Email: ' + profile.getEmail());

      document.getElementById("gmail").value = profile.getEmail();
      document.getElementById("gname").value = profile.getName();

      document.getElementById("googleSignInForm").submit();
}

//The below block handles facebook OAuth Logins

function statusChangeCallback(response) {
  if (response.status === 'connected') {
    //successful facebook OAuth Login
    FB.api('/me', {fields: 'name, email'}, function(response) {
      console.log('Successful login for: ' + response.name + ', with mailing address: ' + response.email);

      document.getElementById("fmail").value = response.email;
      document.getElementById("fname").value = response.name;
      document.getElementById("facebookSignInForm").submit();
    });
  } else {
    //here when facebook oauth login is not a success
    //console.log("Falied to login using fb OAuth");
  }
}

//here when user has clicked the facebook oauth button, and then has exited the fb oauth popup.
// response == success => authorized user approved through facebook api
// response == unknows => user didn't attempt to login or failed to do so
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}

//initializes facebook JS SDK
window.fbAsyncInit = function() {
  FB.init({
    appId      : '667984497449558',
    cookie     : true,
    xfbml      : true,
    version    : 'v8.0'
  });

  //here after the SDK is initialized
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
};
