package com.example.demo.dto;
import java.util.List;

public class OrderRequestDTO {
    private Integer tableId;
    private Integer staffId;
    private Double totalAmount;
    private List<OrderItemRequestDTO> items;

    public OrderRequestDTO() {}

    public Integer getTableId() { return tableId; }
    public void setTableId(Integer tableId) { this.tableId = tableId; }

    public Integer getStaffId() { return staffId; }
    public void setStaffId(Integer staffId) { this.staffId = staffId; }

    public Double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(Double totalAmount) { this.totalAmount = totalAmount; }

    public List<OrderItemRequestDTO> getItems() { return items; }
    public void setItems(List<OrderItemRequestDTO> items) { this.items = items; }

    public static class OrderItemRequestDTO {
        private Integer foodId;
        private Integer quantity;

        public OrderItemRequestDTO() {}

        public Integer getFoodId() { return foodId; }
        public void setFoodId(Integer foodId) { this.foodId = foodId; }

        public Integer getQuantity() { return quantity; }
        public void setQuantity(Integer quantity) { this.quantity = quantity; }
    }
}
