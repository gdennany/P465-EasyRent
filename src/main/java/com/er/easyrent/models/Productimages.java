package com.er.easyrent.models;
import org.springframework.data.annotation.Id;

public class Productimages {
    public Productimages(){

    }
    @Id
    private long id;
    private int product_id;
    private String image;

    public Productimages(int product_id, String image){
        this.product_id = product_id;
        this.image = image;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
