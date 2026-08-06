package com.example.demo.dto;

public class OrderItemDTO {
    private String foodName;
    private Integer quantity;
    private Double price;
    private String itemStatus;

    public OrderItemDTO() {}

    public OrderItemDTO(String foodName, Integer quantity, Double price, String itemStatus) {
        this.foodName = foodName;
        this.quantity = quantity;
        this.price = price;
        this.itemStatus = itemStatus;
    }

    public String getFoodName() { return foodName; }
    public void setFoodName(String foodName) { this.foodName = foodName; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public String getItemStatus() { return itemStatus; }
    public void setItemStatus(String itemStatus) { this.itemStatus = itemStatus; }
}
