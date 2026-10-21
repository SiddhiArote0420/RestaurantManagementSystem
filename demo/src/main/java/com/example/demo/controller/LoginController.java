package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.demo.entity.Staff;
import com.example.demo.service.StaffService;
import org.springframework.http.ResponseEntity;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.example.demo.security.JwtUtil;
import java.util.Optional;

@RestController
@RequestMapping("/api")
// @CrossOrigin removed
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private StaffService staffService;

    @Autowired
    private JwtUtil jwtUtil;

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> loginData) {
        String email = loginData.get("email");
        String password = loginData.get("password");
        
        Optional<Staff> staffOpt = staffService.login(email, password);
        
        if (staffOpt.isEmpty()) {
            logger.warn("Invalid email or password");
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", "Invalid email or password");
            return ResponseEntity.status(401).body(error);
        }

        Staff staff = staffOpt.get();
        String token = jwtUtil.generateToken(staff.getEmail(), staff.getRole(), staff.getStaffId().intValue());

        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Login successful");
        response.put("token", token);
        response.put("role", staff.getRole());
        response.put("name", staff.getName());
        response.put("staffId", staff.getStaffId());

        logger.info("User logged in successfully");
        return ResponseEntity.ok(response);
    }
}
