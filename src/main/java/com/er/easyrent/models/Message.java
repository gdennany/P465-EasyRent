package com.er.easyrent.models;
import org.springframework.data.annotation.Id;
import java.util.*;

public class Message {
    public Message(){}
    public Message(int sender_id, int receiver_id, boolean unread,String message_content, Date date_time){
        this.sender_id = sender_id;
        this.receiver_id = receiver_id;
        this.unread = unread;
        this.message_content = message_content;
        this.date_time = date_time;
    }
    @Id
    private long id;
    private int sender_id;
    private int receiver_id;
    private boolean unread;
    private Date date_time;
    private String message_content;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public int getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(int receiver_id) {
        this.receiver_id = receiver_id;
    }

    public boolean getUnread() {
        return unread;
    }

    public void setUnread(boolean unread) {
        this.unread = unread;
    }


    public String getMessage_content() {
        return message_content;
    }

    public void setMessage_content(String message_content) {
        this.message_content = message_content;
    }

}
