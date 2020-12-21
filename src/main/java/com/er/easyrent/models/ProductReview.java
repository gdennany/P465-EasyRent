package com.er.easyrent.models;

import org.springframework.data.annotation.Id;

public class ProductReview {


    @Id
    private long id;
    private int product_id;
    private String review;
    private int user_that_left_review;
    private int rating;

    public ProductReview(int product_id, String review, int user_that_left_review, int rating){
        this.product_id=product_id;
        this.review=review;
        this.user_that_left_review = user_that_left_review;
        this.rating=rating;
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

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getUser_that_left_review() {
        return user_that_left_review;
    }

    public void setUser_that_left_review(int user_that_left_review) {
        this.user_that_left_review = user_that_left_review;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
