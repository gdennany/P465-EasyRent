package com.er.easyrent.models;
import org.springframework.data.annotation.Id;


public class Product {
    public Product(){
    }
    public Product(String name, String description, String condition, float price_per_day, String price_period, int owner, int quantity, String category, String img_url, String short_desc, String location, int rent_time_limit){
        this.name = name;
        this.description = description;
        this.condition = condition;
        this.price_per_day = price_per_day;
        this.price_period = price_period;
        this.owner = owner;
        this.quantity = quantity;
        this.category = category;
        this.img_url = img_url;
        this.short_desc = short_desc;
        this.location = location;
        this.rent_time_limit= rent_time_limit;
    }
    @Id
    private long id;
    private String name;
    private String condition;

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    private float price_per_day;

    public String getPrice_period() {
        return price_period;
    }

    public void setPrice_period(String price_period) {
        this.price_period = price_period;
    }

    private String price_period;
    private int owner;
    private int quantity;
    private String category;
    private String description;
    private String short_desc;
    private String location;
    private String img_url;
    private int rent_time_limit;
    public int getRent_time_limit() {
        return rent_time_limit;
    }

    public void setRent_time_limit(int rent_time_limit) {
        this.rent_time_limit = rent_time_limit;
    }





    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShort_desc() {
        return short_desc;
    }

    public void setShort_desc(String short_desc) {
        this.short_desc = short_desc;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }



    public long getId() {
        return id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public float getPrice_per_day() {
        return price_per_day;
    }

    public void setPrice_per_day(float price_per_day) {
        this.price_per_day = price_per_day;
    }

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id == product.id;
    }

    @Override
    public int hashCode() {
        return (int) id;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}