package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
    private Long orderDetailId;
    private Long orderId;
    private Long foodId;
    private Integer quantity;
    private String itemStatus;
}
