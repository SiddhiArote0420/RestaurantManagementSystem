package com.example.demo.service;

import com.example.demo.dto.OrderDTO;
import com.example.demo.dto.OrderItemDTO;
import com.example.demo.repository.OrderDetailRepository;
import com.example.demo.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> orders = orderRepository.findAllOrdersWithStaffName();
        // For each order, fetch its items
        for (OrderDTO order : orders) {
            List<OrderItemDTO> items = orderDetailRepository.findItemsByOrderId(order.getOrderId());
            order.setItems(items);
        }
        return orders;
    }

        @org.springframework.transaction.annotation.Transactional //@Transactional - The database operations inside this method are executed within a single transaction.
    public void createOrder(com.example.demo.dto.OrderRequestDTO orderRequest) {
        // Create Order (Status defaults to 'Preparing')
        Long orderId = orderRepository.createOrder(
            orderRequest.getTableId(),
            orderRequest.getStaffId(),
            orderRequest.getTotalAmount(),
            "PENDING"
        );
        
        // Add all order details
        if (orderRequest.getItems() != null) {
            for (com.example.demo.dto.OrderRequestDTO.OrderItemRequestDTO item : orderRequest.getItems()) {
                orderDetailRepository.addOrderItem(
                    orderId,
                    item.getFoodId(),
                    item.getQuantity(),
                    "PENDING"
                );
            }
        }
    }

        @org.springframework.transaction.annotation.Transactional
    public void updateOrder(Long orderId, com.example.demo.dto.OrderRequestDTO orderRequest) {
        // Delete existing items
        orderDetailRepository.deleteItemsByOrderId(orderId);
        
        // Update order total amount
        orderRepository.updateOrderTotalAmount(orderId, orderRequest.getTotalAmount());
        
        // Insert new items
        if (orderRequest.getItems() != null) {
            for (com.example.demo.dto.OrderRequestDTO.OrderItemRequestDTO item : orderRequest.getItems()) {
                orderDetailRepository.addOrderItem(
                    orderId,
                    item.getFoodId(),
                    item.getQuantity(),
                    "PENDING" // Default item status
                );
            }
        }
    }

    public void updateOrderStatus(Long orderId, String status) {
        orderRepository.updateOrderStatus(orderId, status);
    }

    // NEW: Appends items to an existing order without deleting previously ordered items.
    // Called when customer orders additional food after chef has already started preparing.
    @org.springframework.transaction.annotation.Transactional
    public void appendItemsToOrder(Long orderId, com.example.demo.dto.OrderRequestDTO request) {
        // 1. Append each new item — does NOT delete existing order_details rows
        if (request.getItems() != null) {
            for (com.example.demo.dto.OrderRequestDTO.OrderItemRequestDTO item : request.getItems()) {
                orderDetailRepository.addItemsToOrder(orderId, item.getFoodId(), item.getQuantity());
            }
        }
        // 2. Update the total amount on the order (existing total + new items total is pre-calculated on frontend)
        orderRepository.updateOrderTotalAmount(orderId, request.getTotalAmount());
    }

    public void deleteOrder(Long id) {
        orderRepository.deleteOrderById(id);
    }
}


