package com.example.demo.entity;

public class Menu {

    private Long menuId;
    private String name;
    private Double price;
    private Category category;

    public Menu() {}

    public Menu(String name, Double price, Category category) {
        this.name = name;
        this.price = price;
        this.category = category;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
