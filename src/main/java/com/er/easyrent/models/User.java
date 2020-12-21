package com.er.easyrent.models;
import org.springframework.data.annotation.Id;

import java.util.Date;
import java.util.HashMap;

public class User {

    public User() {
    }

    //public User(String username, String password, String email, boolean isadmin, boolean otp) {
    public User(String username, String password, String email, boolean isadmin, boolean otp, String profilephoto) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.isadmin = isadmin;
        this.otp = otp;
        this.profilephoto = profilephoto;
    }

    @Id
    private Long id;

    private String username;

    private String password;

    private String email;
    private boolean isadmin;
    private boolean otp;

    public boolean isIsadmin() {
        return isadmin;
    }

    public String getProfilephoto() {
        return profilephoto;
    }

    public void setProfilephoto(String profilephoto) {
        this.profilephoto = profilephoto;
    }

    private String profilephoto;

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

    public boolean isOtp() {
        return otp;
    }

    public void setOtp(boolean otp) {
        this.otp = otp;
    }
/*
    private HashMap<Integer, Integer> securityQuestions;
>>>>>>> origin/database

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

    public boolean isOtp() {
        return otp;
    }

    public void setOtp(boolean otp) {
        this.otp = otp;
    }
/*
    private HashMap<Integer, Integer> securityQuestions;
    private Date lastPasswordChange;
     */


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}