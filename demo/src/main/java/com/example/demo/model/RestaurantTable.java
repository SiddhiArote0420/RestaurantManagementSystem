package com.example.demo.model;
public class RestaurantTable {
    private int tableId;
    private int tableNumber;
    private String status;
    private Integer assignedStaffId;
    private Integer customerCount;

    public RestaurantTable() {}

    public RestaurantTable(int tableId, int tableNumber, String status, Integer assignedStaffId, Integer customerCount) {
        this.tableId = tableId;
        this.tableNumber = tableNumber;
        this.status = status;
        this.assignedStaffId = assignedStaffId;
        this.customerCount = customerCount;
    }

    public int getTableId() { return tableId; }
    public void setTableId(int tableId) { this.tableId = tableId; }
    public int getTableNumber() { return tableNumber; }
    public void setTableNumber(int tableNumber) { this.tableNumber = tableNumber; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Integer getAssignedStaffId() { return assignedStaffId; }
    public void setAssignedStaffId(Integer assignedStaffId) { this.assignedStaffId = assignedStaffId; }
    public Integer getCustomerCount() { return customerCount; }
    public void setCustomerCount(Integer customerCount) { this.customerCount = customerCount; }
}
