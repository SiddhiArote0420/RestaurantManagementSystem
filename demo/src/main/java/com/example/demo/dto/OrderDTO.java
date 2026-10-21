package com.example.demo.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO {
    private Long orderId;
    private Integer tableId;
    private String staffName;
    private Double totalAmount;
    private String overallStatus;
    private List<OrderItemDTO> items;
}
