package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestHeader;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class DashboardController {

    @Autowired
    private com.example.demo.repository.StaffRepository staffRepository;

    @Autowired
    private org.springframework.jdbc.core.JdbcTemplate jdbcTemplate;

    @GetMapping("/dashboard/stats")
    public ResponseEntity<?> getDashboardStats(@RequestHeader(value = "role", required = false) String role) {
        
        // Authorization check
        if (!"ADMIN".equals(role)) {
            return ResponseEntity.status(401).body(java.util.Collections.singletonMap("error", "Unauthorized: Only Admin can view stats"));
        }

        Map<String, Object> response = new HashMap<>();

        // Fetch real values from database
        long staffCount = staffRepository.count();
        Integer todayOrders = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM orders", Integer.class);
        if (todayOrders == null) todayOrders = 0;

        response.put("staffCount", staffCount);
        response.put("todayOrders", todayOrders);

        // Calculate sales for the last 7 days
        java.util.List<String> labels = new java.util.ArrayList<>();
        java.util.List<Double> data = new java.util.ArrayList<>();
        
        java.time.LocalDate today = java.time.LocalDate.now();
        for (int i = 6; i >= 0; i--) {
            java.time.LocalDate date = today.minusDays(i);
            String dayOfWeek = date.getDayOfWeek().getDisplayName(java.time.format.TextStyle.SHORT, java.util.Locale.ENGLISH);
            labels.add(dayOfWeek);
            
            Double dailyTotal = jdbcTemplate.queryForObject(
                "SELECT SUM(amount_paid) FROM payment WHERE payment_date = ?", 
                Double.class, 
                date
            );
            if (dailyTotal == null) dailyTotal = 0.0;
            
            data.add(dailyTotal);
        }

        response.put("graphLabels", labels);
        response.put("graphData", data);

        return ResponseEntity.ok(response);
    }
}