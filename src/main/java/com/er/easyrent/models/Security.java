package com.er.easyrent.models;
import org.springframework.data.annotation.Id;

public class Security {
    public Security(){

    }
    @Id
    private long id;
    private int user_id;
    private int security_q1;
    private int security_q2;
    private String security_a1;
    private String security_a2;
    private String email;

    public Security(int user_id, int security_q1, int security_q2, String security_a1, String security_a2, String email){
        this.user_id = user_id;
        this.security_q1 = security_q1;
        this.security_q2 = security_q2;
        this.security_a1 = security_a1;
        this.security_a2 = security_a2;
        this.email = email;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getSecurity_q1() {
        return security_q1;
    }

    public void setSecurity_q1(int security_q1) {
        this.security_q1 = security_q1;
    }

    public int getSecurity_q2() {
        return security_q2;
    }

    public void setSecurity_q2(int security_q2) {
        this.security_q2 = security_q2;
    }

    public String getSecurity_a1() {
        return security_a1;
    }

    public void setSecurity_a1(String security_a1) {
        this.security_a1 = security_a1;
    }

    public String getSecurity_a2() {
        return security_a2;
    }

    public void setSecurity_a2(String security_a2) {
        this.security_a2 = security_a2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
