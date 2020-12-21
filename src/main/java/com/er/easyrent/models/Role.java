package com.er.easyrent.models;
import org.springframework.data.annotation.Id;

public class Role {
    public Role(){

    }
    public Role(int user_id, int role_id){
        this.user_id = user_id;
        this.role_id = role_id;
    }
    @Id
    private long id;
    private int user_id;
    private int role_id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
}
