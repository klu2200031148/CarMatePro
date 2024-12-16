package com.model;

public class Car {
    private int id;  // Add ID field
    private String companyName;
    private String carCategory;
    private String carName;
    private String carImage;
    private double price;
    private String otherDetails;

    // Default constructor
    public Car() {
    }

    // Constructor with parameters
    public Car(String companyName, String carCategory, String carName, String carImage, double price, String otherDetails) {
        this.companyName = companyName;
        this.carCategory = carCategory;
        this.carName = carName;
        this.carImage = carImage;
        this.price = price;
        this.otherDetails = otherDetails;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCarCategory() {
        return carCategory;
    }

    public void setCarCategory(String carCategory) {
        this.carCategory = carCategory;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getCarImage() {
        return carImage;
    }

    public void setCarImage(String carImage) {
        this.carImage = carImage;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(String otherDetails) {
        this.otherDetails = otherDetails;
    }
}
