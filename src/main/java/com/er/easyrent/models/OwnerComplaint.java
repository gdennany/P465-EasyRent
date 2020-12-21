package com.er.easyrent.models;
import org.springframework.data.annotation.Id;

public class OwnerComplaint {
    public OwnerComplaint(){};

    @Id
    private long id;
    private int user_that_was_complained_about;
    private String complaint;
    private int user_that_left_complaint;

    public OwnerComplaint(int user_that_was_complained_about, String complaint, int user_that_left_complaint){
        this.user_that_was_complained_about=user_that_was_complained_about;
        this.complaint=complaint;
        this.user_that_left_complaint=user_that_left_complaint;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getUser_that_was_complained_about() {
        return user_that_was_complained_about;
    }

    public void setUser_that_was_complained_about(int user_that_was_complained_about) {
        this.user_that_was_complained_about = user_that_was_complained_about;
    }

    public String getComplaint() {
        return complaint;
    }

    public void setComplaint(String complaint) {
        this.complaint = complaint;
    }

    public int getUser_that_left_complaint() {
        return user_that_left_complaint;
    }

    public void setUser_that_left_complaint(int user_that_left_complaint) {
        this.user_that_left_complaint = user_that_left_complaint;
    }
}
