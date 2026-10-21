package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RestaurantTable {
    private Integer tableId;
    private Integer tableNumber;
    private String status;
    private Integer assignedStaffId;
    private Integer customerCount;
}
