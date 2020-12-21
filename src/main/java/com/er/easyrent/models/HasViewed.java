package com.er.easyrent.models;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

public class HasViewed{
    public HasViewed(){

    }
    public HasViewed(int user_id, int product_id){
        this.user_id = user_id;
        this.product_id = product_id;
    }
    @Id
    private long id;
    private int user_id;
    private int product_id;

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

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


}
