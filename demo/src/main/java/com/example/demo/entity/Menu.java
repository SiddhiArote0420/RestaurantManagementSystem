package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Menu {
    private Long menuId;
    private String name;
    private Double price;
    private Category category;
    private boolean available = true;

    public Menu(String name, Double price, Category category) {
        this.name = name;
        this.price = price;
        this.category = category;
    }
}
