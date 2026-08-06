package com.example.demo.dto;

public class MenuDTO {
    private Long menuId;
    private String name;
    private String category;
    private Double price;
    private boolean available = true; // Always true for now as db doesn't support it

    public MenuDTO() {}

    public MenuDTO(Long menuId, String name, String category, Double price) {
        this.menuId = menuId;
        this.name = name;
        this.category = category;
        this.price = price;
    }

    public Long getMenuId() { return menuId; }
    public void setMenuId(Long menuId) { this.menuId = menuId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public boolean isAvailable() { return available; }
    public void setAvailable(boolean available) { this.available = available; }
}
