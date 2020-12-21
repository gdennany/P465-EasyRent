package com.er.easyrent;

import com.er.easyrent.models.Security;
import com.er.easyrent.models.User;
import com.er.easyrent.repos.SecurityRepository;
import com.er.easyrent.repos.UserRepository;
import com.er.easyrent.services.Emailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Handles the login and registration page
 */
@Controller
public class LoginController {

	private String gmailPass = "GMAILAUTHORIZED";
	private String fbPass = "FACEBOOKAUTHORIZED";
	private boolean isadmin = false;
	private boolean otp = false;
	private String profilephoto="";

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private SecurityRepository securityRepository;

	/**
	 * Renders the login and registration page
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.GET)
	public String loginAndRegistration(ModelMap model) {
		model.addAttribute("loginResult", "");
		model.addAttribute("successfulForgotPassEmailInput", "");
		model.addAttribute("passwordReset", "");
		model.addAttribute("noAccount", "");
		model.addAttribute("OTP", "");
		model.addAttribute("successfulOTP", "");

		return "login-and-registration";
	}

	/**
	 * Here when the user attempts to sign in manually (not using the Facebook / Google OAuth methods)
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.POST, params = {"emailInput", "passwordInput"})
	public String submitLogin(ModelMap model, HttpServletResponse resp, HttpSession sesh, @RequestParam("emailInput") String emailInput, @RequestParam("passwordInput") String passwordInput) {
		model.addAttribute("successfulForgotPassEmailInput", "");
		Iterable<User> logins = userRepository.findAll();
		boolean hasAccount = false;

		for (User user : logins) {
			if (emailInput.equals(user.getEmail())) {
				hasAccount = true;
				if (user.getPassword().equals(gmailPass)) model.addAttribute("loginResult", "An account with this email has already been created using Google authorization. Please sign in using the Google button.");
				else if (user.getPassword().equals(fbPass)) model.addAttribute("loginResult", "An account with this email has already been created using Facebook authorization. Please sign in using the Facebook button.");
				else if (user.isOtp()) {
					model.addAttribute("OTP", "1");
					model.addAttribute("userEmail", user.getEmail());
					return "login-and-registration";
				}
				else if (passwordInput.equals(user.getPassword())) {
					sesh.setAttribute("username", ", " + user.getUsername());
					sesh.setAttribute("id",user.getId());
					sesh.setAttribute("loggedInUser", user);
					resp.setHeader("Location", "/");
					resp.setStatus(302);
					return "redirect:" + "/";
				}  //successful login
				else model.addAttribute("loginResult", "Incorrect password for account associated with email " + emailInput + ".");
				break;
			}
		}

		if (!hasAccount) model.addAttribute("loginResult", "No account with email " + emailInput + " exists.");

		return "login-and-registration";
	}

	/**
	 * Here when the user attempts to sign in using the Google OAuth method
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.POST, params = {"gmail", "gname"})
	public String submitLoginGoogle(ModelMap model, HttpServletRequest req, HttpServletResponse resp, HttpSession sesh, @RequestParam("gmail") String gmail, @RequestParam("gname") String gname) {
		Iterable<User> logins = userRepository.findAll();
		boolean hasAccount = false;

		//no email in db? => first time signing up, sign user up and log them in
		//email in db? =>
		// google authorized in db? => succesful login
		// non-google authorized? => notify user an account already exists, recommend using the google oauth login method

		for (User user : logins) {
			if (gmail.equals(user.getEmail())) {
				hasAccount = true;
				if (user.getPassword().equals(gmailPass)) {
					sesh.setAttribute("username", ", " + user.getUsername());
					sesh.setAttribute("id",user.getId());
					sesh.setAttribute("loggedInUser", user);
					resp.setHeader("Location", "/");
					resp.setStatus(302);
					return "redirect:" + "/";
				}
				else model.addAttribute("loginResult", "An account already exists with this email (not using Google sign in authorization). Please manually sign in without using the Google button.");

				break;
			}
		}

		//first time signing in using google oauth for user
		if (!hasAccount) {
			User newRegistration = new User(gname, gmailPass, gmail, isadmin, otp, profilephoto);
			userRepository.save(newRegistration);
			//model.addAttribute("loginResult", "Successful sign up of new user using Google account authorization.");
			sesh.setAttribute("username", ", "+ gname);
			sesh.setAttribute("id", newRegistration.getId());
			sesh.setAttribute("loggedInUser", newRegistration);
			resp.setHeader("Location", "/");
			resp.setStatus(302);
			return "redirect:" + "/";
		}


		return "login-and-registration";
	}

	/**
	 * Here when the user attempts to sign in using the Facebook OAuth method
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.POST, params = {"fmail", "fname"})
	public String submitLoginFacebook(ModelMap model, HttpSession sesh, HttpServletResponse resp, @RequestParam("fmail") String fmail, @RequestParam("fname") String fname) {
		Iterable<User> logins = userRepository.findAll();
		boolean hasAccount = false;

		//no email in db? => first time signing up, sign user up and log them in
		//email in db? =>
		// google authorized in db? => succesful login
		// non-google authorized? => notify user an account already exists, recommend using the google oauth login method

		for (User user : logins) {
			if (fmail.equals(user.getEmail())) {
				hasAccount = true;
				//if (user.getPassword().equals(fbPass)) model.addAttribute("loginResult", "Successful Login using Facebook authoriation");
				if (user.getPassword().equals(fbPass)) {
					sesh.setAttribute("username", ", " + user.getUsername());
					sesh.setAttribute("id",user.getId());
					sesh.setAttribute("loggedInUser", user);
					resp.setHeader("Location", "/");
					resp.setStatus(302);
					return "redirect:" + "/";
				}
				else model.addAttribute("loginResult", "An account already exists with this email (not using Facebook sign in authorization). Please manually sign in.");
				break;
			}
		}

		//first time signing in using google oauth for user
		if (!hasAccount) {
			//User newRegistration = new User(fname, fbPass, fmail);
			User newRegistration = new User(fname, fbPass, fmail, isadmin, otp, profilephoto);
			userRepository.save(newRegistration);
			//model.addAttribute("loginResult", "Successful sign up of new user using Facebook account authorization.");
			sesh.setAttribute("username", ", " + fname);
			sesh.setAttribute("id", newRegistration.getId());
			sesh.setAttribute("loggedInUser", newRegistration);
			resp.setHeader("Location", "/");
			resp.setStatus(302);
			return "redirect:" + "/";
		}

		return "login-and-registration";
	}

	/**
	 * Here when user submits forgot my password forms email part
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.POST, params = {"forgotPassEmailInput"})
	public String forgotPassword(ModelMap model, @RequestParam("forgotPassEmailInput") String email) {
		Iterable<Security> logins = securityRepository.findAll();
		Iterable<User> users = userRepository.findAll();

		//String test = email;

		for (Security user : logins) {
			if (email.equals(user.getEmail())) {
				model.addAttribute("successfulForgotPassEmailInput", "1");
				model.addAttribute("forgotPassEmailInput", user.getEmail());
				model.addAttribute("securityQ1", String.valueOf(user.getSecurity_q1()));
				model.addAttribute("securityQ2", String.valueOf(user.getSecurity_q2()));
				return "login-and-registration";
			}
		}

		for (User currentUser : users) {
			if (currentUser.getEmail().equals(email)) {
				if (currentUser.getPassword().equals(gmailPass) || currentUser.getPassword().equals(fbPass)) {
					model.addAttribute("passwordReset", "-2");
					return "login-and-registration";
				}
			}
		}

		//only here if theres no account associated with the email the user input
		model.addAttribute("successfulForgotPassEmailInput", "1");
		model.addAttribute("noAccount", "1");
		return "login-and-registration";
	}

	/**
	 * Here when user submits forgot my password form answer to security questions
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.POST, params = {"forgotPassEmailInput", "securityQ1Answer", "securityQ2Answer"})
	public String forgotPasswordSecurityQuestions(ModelMap model, @RequestParam("forgotPassEmailInput") String email, @RequestParam("securityQ1Answer") String securityQ1Answer,
												  @RequestParam("securityQ2Answer") String securityQ2Answer) {
		Iterable<User> logins = userRepository.findAll();
		Iterable<Security> securities = securityRepository.findAll();

		for (Security currentSecurity : securities) {
			if (email.equals(currentSecurity.getEmail())) {
				if (securityQ1Answer.equalsIgnoreCase(currentSecurity.getSecurity_a1()) && securityQ2Answer.equalsIgnoreCase(currentSecurity.getSecurity_a2())) {

					for (User currentUser : logins) {
						if (currentUser.getEmail().equals(currentSecurity.getEmail())) {
							Emailer emailer = new Emailer();
							try {
								//send randomly generated password to user in email and change users password to this new password in the database
								String randomPassword = emailer.sendForgotPasswordEmail(currentUser.getEmail(), currentUser.getUsername());
								currentUser.setPassword(randomPassword);
								currentUser.setOtp(true);
								userRepository.save(currentUser);
								model.addAttribute("passwordReset", "1");
								return "login-and-registration";
							} catch (MessagingException e) {
								e.printStackTrace();
							}
						}
					}
				}
				else {
					model.addAttribute("passwordReset", "-3");
					return "login-and-registration";
				}
			}
		}

		model.addAttribute("passwordReset", "-1");
		return "login-and-registration";
	}


	/**
	 * Here when the user is prompted to reset their OTP
	 */
	@RequestMapping(value = "/login-and-registration", method = RequestMethod.POST, params = {"newPassword", "newConfirmPassword", "userEmail"})
	public String OTPReset(ModelMap model, HttpSession sesh, HttpServletResponse resp, @RequestParam("newPassword") String newPassword, @RequestParam("newConfirmPassword") String newConfirmPassword,
						   @RequestParam("userEmail") String userEmail) {
		Iterable<User> logins = userRepository.findAll();

		for (User login : logins) {
			if (login.getEmail().equals(userEmail)) {
				//passwords don't match
				if (!newPassword.equals(newConfirmPassword)) {
					model.addAttribute("successfulOTP", "-1");
					model.addAttribute("OTP", "1");
					model.addAttribute("userEmail", login.getEmail());
					return "login-and-registration";
				} else {
					//new passwords match => update user password in database and then redirect to home page
					login.setPassword(newPassword);
					login.setOtp(false);
					userRepository.save(login);
					sesh.setAttribute("username", ", " + login.getUsername());
					sesh.setAttribute("id", login.getId());
					sesh.setAttribute("loggedInUser", login);
					resp.setHeader("Location", "/");
					resp.setStatus(302);
					return "redirect:" + "/";
				}
			}
		}


		return "login-and-registration";
	}


	/**
	 * Here when the user attempts to sign up
	 */
	@RequestMapping(value = "/sign-up", method = RequestMethod.POST)
	public String submitSignUp(ModelMap model, HttpSession sesh, HttpServletResponse resp, @RequestParam("name") String name, @RequestParam("email") String email,
							   @RequestParam("password") String password, @RequestParam("confirmPassword") String confirmPassword,
							   @RequestParam("securityQ1SignUp") int securityQ1, @RequestParam("securityQ2SignUp") int securityQ2,
							   @RequestParam("securityQ1AnswerSignUp") String securityQ1Answer, @RequestParam("securityQ2AnswerSignUp") String securityQ2Answer) {

		Iterable<User> logins = userRepository.findAll();

		if (!password.equals(confirmPassword)) {
			model.addAttribute("signUpResult", "Passwords don't match.");
			return "login-and-registration";
		}

		for (User user : logins) {
			if (email.equals(user.getEmail())) {
				if (user.getPassword().equals(gmailPass)) model.addAttribute("signUpResult", "A Google authorized account already exists with that email " + email + ". Please sign in using the Google button.");
				else if (user.getPassword().equals(fbPass)) model.addAttribute("signUpResult", "A Facebook authorized account already exists with email " + email + ". Please sign in using the Facebook button.");
				else model.addAttribute("signUpResult", "An account already exists with email " + email + ".");
				return "login-and-registration";
			}
		}

		User newRegistration = new User(name, password, email, isadmin, otp, null);
		userRepository.save(newRegistration);
		Security newSecurity = new Security(Math.toIntExact(newRegistration.getId()), securityQ1, securityQ2, securityQ1Answer, securityQ2Answer, email);
		securityRepository.save(newSecurity);
		//model.addAttribute("signUpResult", "Successful sign up of new user");
		sesh.setAttribute("username", ", "+ name);
		sesh.setAttribute("id", newRegistration.getId());
		sesh.setAttribute("loggedInUser", newRegistration);
		resp.setHeader("Location", "/");
		resp.setStatus(302);

		return "redirect:" + "/";
	}
}