package com.er.easyrent.services;

import org.apache.commons.lang.RandomStringUtils;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;


/**
 * This class sends emails through the gmail server
 */
public class Emailer {

    String host = "smtp.gmail.com";
    String from = "easyrentcustomerservice";
    String pass = "EasyRent123";

    public Emailer() {
    }

    /**
     * Sends an email from easyrentcustomerservice@gmail.com to the recipient specified in the instantiation of this object.
     * Throws a messaging exception if anything fails during sending of the message.
     */
    //public void sendEmail(String from, String to, String emailSubjectLine, String emailMessageBody) throws MessagingException {
    public void sendEmail(String to, String subject, String body) throws MessagingException {
        //get necessary system settings for sending email over the gmail server
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }

    /**
     * Sends an email from easyrentcustomerservice@gmail.com to the recipient specified in the instantiation of this object.
     * This method generates a random string and notifies the user that it is their new password.
     * Throws a messaging exception if anything fails during sending of the message.
     */
    public String sendForgotPasswordEmail(String to, String username) throws MessagingException {
        String subject = "Your EasyRent password reset";

        String newRandomPassword = RandomStringUtils.random(12, true, true);

        String body = "Hi " + username + ",\n\nYou recently requested a password change for your EasyRent account. We have generated a new password for you " +
                "to log in with.\n\nYour new password: " + newRandomPassword + "\n\nTo keep your account secure, please don't forward this email to anyone and " +
                "change your password again in your user settings.\n\nHappy EasyRenting!";

        //get necessary system settings for sending email over the gmail server
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }

        return newRandomPassword;
    }

    /**
     * Sends an email to from our email account to our own account containing the user input from the contact us form
     */
    //public void sendEmail(String from, String to, String emailSubjectLine, String emailMessageBody) throws MessagingException {
    public void sendContactUsEmail(String userMessage, String name, String userEmail, String subject) throws MessagingException {
        //get necessary system settings for sending email over the gmail server
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        String body = "This message was sent by an EasyRent customer service inquiry.\n\n" +
                "User name: " + name + "\nUser email: " + userEmail + "\nSubject of user Issue: " + subject +
                "\n\n" + userMessage;

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        String from = "easyrentcustomerservice@gmail.com";

        try {
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(from));

            message.setSubject("Contact Us Form Submission From User");

            message.setText(body);

            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
