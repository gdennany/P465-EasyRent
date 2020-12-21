package com.er.easyrent;


import com.er.easyrent.services.Emailer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;

/**
 * Handles the contact us page
 */
@Controller
public class ContactController {
    /**
     * Renders the login and registration page
     */
    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String loginAndRegistration(ModelMap model) {
        model.addAttribute("successfulContact", "");
        return "contact";
    }

    /**
     * Here when the user attempts to send the contact form
     */
    @RequestMapping(value = "/contact", method = RequestMethod.POST, params = {"message", "name", "email", "subject"})
    public String submitLogin(ModelMap model, @RequestParam("message") String message, @RequestParam("name") String name,
                              @RequestParam("email") String userEmail, @RequestParam("subject") String subject) {

        Emailer emailer = new Emailer();
        try {
            emailer.sendContactUsEmail(message, name, userEmail, subject);
            model.addAttribute("successfulContact", "1");
        } catch (MessagingException ex) {
            model.addAttribute("successfulContact", "-1");
        }
        return "contact";
    }
}
