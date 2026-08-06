package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.entity.Staff;
import com.example.demo.service.StaffService;

import jakarta.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private StaffService staffService;

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> loginData) {
        
        String email = loginData.get("email");
        String password = loginData.get("password");
        
        Staff staff = staffService.login(email, password);
        
        if (staff == null) {
            logger.warn("Invalid email or password");
            throw new com.example.demo.exception.InvalidInputException("Invalid email or password");
        }

        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Login successful");
        response.put("role", staff.getRole());
        response.put("name", staff.getName());
        response.put("staffId", staff.getStaffId());

        logger.info("User logged in successfully");
        return ResponseEntity.ok(response);
    }
}