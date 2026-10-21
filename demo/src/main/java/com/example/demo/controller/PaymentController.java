package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.example.demo.entity.Payment;
import com.example.demo.service.PaymentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/payments")
public class PaymentController {

    private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

    @Autowired
    private PaymentService paymentService;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ADMIN')")
    public List<Payment> getAllPayments() {
        return paymentService.getAllPayments();
    }

    @PostMapping("/add")
    @PreAuthorize("hasAnyRole('RECEPTIONIST', 'ADMIN')")
    public ResponseEntity<Map<String, Object>> addPayment(@RequestBody Payment payment) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = paymentService.addPayment(payment);
            if (success) {
                logger.info("Payment completed successfully");
                response.put("success", true);
                response.put("message", "Payment added successfully");
            } else {
                response.put("success", false);
                response.put("message", "Failed to add payment");
            }
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Map<String, Object>> updatePayment(@PathVariable int id, @RequestBody Payment payment) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = paymentService.updatePayment(id, payment);
            if (success) {
                response.put("success", true);
                response.put("message", "Payment updated successfully");
            } else {
                response.put("success", false);
                response.put("message", "Failed to update payment");
            }
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Map<String, Object>> deletePayment(@PathVariable int id) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = paymentService.deletePayment(id);
            if (success) {
                response.put("success", true);
                response.put("message", "Payment deleted successfully");
            } else {
                response.put("success", false);
                response.put("message", "Failed to delete payment");
            }
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }
}

