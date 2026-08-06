package com.example.demo.controller;

import com.example.demo.dto.OrderDTO;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin(origins = "*")
public class OrderController {

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addOrder(@RequestBody com.example.demo.dto.OrderRequestDTO orderRequest) {
        Map<String, Object> response = new HashMap<>();
        try {
            orderService.createOrder(orderRequest);
            logger.info("Order created successfully");
            response.put("success", true);
            response.put("message", "Order created successfully");
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            response.put("success", false);
            response.put("message", "Failed to create order: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<Map<String, Object>> updateOrder(@PathVariable Long id, @RequestBody com.example.demo.dto.OrderRequestDTO orderRequest) {
        Map<String, Object> response = new HashMap<>();
        try {
            orderService.updateOrder(id, orderRequest);
            response.put("success", true);
            response.put("message", "Order updated successfully");
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            response.put("success", false);
            response.put("message", "Failed to update order: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    @PutMapping("/updateStatus/{id}")
    public ResponseEntity<Map<String, Object>> updateOrderStatus(@PathVariable Long id, @RequestParam String status) {
        Map<String, Object> response = new HashMap<>();
        try {
            orderService.updateOrderStatus(id, status);
            response.put("success", true);
            response.put("message", "Order status updated successfully");
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            response.put("success", false);
            response.put("message", "Failed to update order status: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    @GetMapping("/all")
    public List<OrderDTO> getAllOrders() {
        return orderService.getAllOrders();
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteOrder(@PathVariable Long id) {
        orderService.deleteOrder(id);
        Map<String, String> response = new HashMap<>();
        response.put("message", "Order deleted successfully");
        return ResponseEntity.ok(response);
    }
}
