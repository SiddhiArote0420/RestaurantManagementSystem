package com.example.demo.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderRequestDTO {
    private Integer tableId;
    private Integer staffId;
    private Double totalAmount;
    private List<OrderItemRequestDTO> items;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class OrderItemRequestDTO {
        private Integer foodId;
        private Integer quantity;
    }
}
