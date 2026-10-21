package com.example.demo.service;

import java.util.Optional;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Staff;
import com.example.demo.repository.StaffRepository;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StaffService {
	
    @Autowired
    private StaffRepository staffRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private EmailService emailService;

    // Login
    public Optional<Staff> login(String email, String password) {
        log.info("Attempting login for email: {}", email);
        Staff staff = staffRepository.findByEmail(email);
        
        if (staff != null) {
            String dbPassword = staff.getPassword();
            boolean isPasswordMatch = false;
            boolean needsUpgrade = false;

            // Check if it's already a BCrypt hash
            if (dbPassword != null && dbPassword.startsWith("$2a$")) {
                isPasswordMatch = passwordEncoder.matches(password, dbPassword);
            } else {
                // Fallback for old plain-text passwords
                isPasswordMatch = password.equals(dbPassword);
                if (isPasswordMatch) {
                    needsUpgrade = true;
                }
            }

            if (isPasswordMatch) {
                if (needsUpgrade) {
                    // Upgrade to BCrypt automatically
                    log.info("Upgrading password to BCrypt for email: {}", email);
                    staff.setPassword(passwordEncoder.encode(password));
                    staffRepository.save(staff);
                }
                log.info("Login successful for email: {}", email);
                return Optional.of(staff);
            }
        }
        
        log.warn("Login failed for email: {}", email);
        return Optional.empty();
    }

    // Add Staff
    public Staff addStaff(Staff staff) {
        log.info("Adding new staff with email: {}", staff.getEmail());
        String rawPassword = staff.getPassword();
        staff.setPassword(passwordEncoder.encode(rawPassword));
        
        Staff savedStaff = staffRepository.save(staff);
        
        // Send email with credentials in background thread (optional, but good practice)
        new Thread(() -> {
            emailService.sendStaffCredentials(savedStaff.getEmail(), savedStaff.getName(), rawPassword, savedStaff.getRole());
        }).start();
        
        return savedStaff;
    }
    
    // Get all Staff
    public List<Staff> getAllStaff() {
        return staffRepository.findAll();
    }

    // Get paginated Staff
    public com.example.demo.dto.PaginatedResponse<Staff> getStaffPage(int page, int size) {
        int offset = (page - 1) * size;
        List<Staff> staffList = staffRepository.findPage(size, offset);
        long totalItems = staffRepository.count();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        return new com.example.demo.dto.PaginatedResponse<>(staffList, page, totalPages, totalItems);
    }

    // Update Staff
    public Optional<Staff> updateStaff(Long id, Staff staffDetails) {
        log.info("Updating staff with id: {}", id);
        return staffRepository.findById(id).map(existingStaff -> {
            existingStaff.setName(staffDetails.getName());
            existingStaff.setEmail(staffDetails.getEmail());
            existingStaff.setRole(staffDetails.getRole());
            
            // Ignored password completely for edit scenario (Requirement 13)
            // Existing BCrypt hashed password remains unchanged.

            return staffRepository.save(existingStaff);
        });
    }

    // Delete Staff
    public boolean deleteStaff(Long id) {
        log.info("Deleting staff with id: {}", id);
        Optional<Staff> existingStaff = staffRepository.findById(id);
        if (existingStaff.isPresent()) {
            staffRepository.deleteById(id);
            return true;
        }
        return false;
    }
}
