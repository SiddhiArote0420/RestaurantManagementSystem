package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuDTO {
    private Long menuId;
    private String name;
    private String category;
    private Double price;
    private boolean available = true;

    public MenuDTO(Long menuId, String name, String category, Double price) {
        this.menuId = menuId;
        this.name = name;
        this.category = category;
        this.price = price;
        this.available = true;
    }
}
