package com.example.demo.service;

import java.util.Optional;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.entity.Staff;
import com.example.demo.repository.StaffRepository;

@Service
public class StaffService {
	
	 @Autowired
	    private StaffRepository staffRepository;

	    // Login
	    public Staff login(String email, String password) {
	        return staffRepository.findByEmailAndPassword(email, password);
	    }

	    // Add Staff
	    public Staff addStaff(Staff staff) {
	        return staffRepository.save(staff);
	    }
	    
	    // Get all Staff
	    public List<Staff> getAllStaff() {
	        return staffRepository.findAll();
	    }

	    // Update Staff
	    public Staff updateStaff(Long id, Staff staffDetails) {
	        Staff existingStaff = staffRepository.findById(id).orElse(null);
	        if (existingStaff != null) {
	            existingStaff.setName(staffDetails.getName());
	            existingStaff.setEmail(staffDetails.getEmail());
	            existingStaff.setRole(staffDetails.getRole());
	            if(staffDetails.getPassword() != null && !staffDetails.getPassword().isEmpty()) {
	                existingStaff.setPassword(staffDetails.getPassword());
	            }
	            return staffRepository.save(existingStaff);
	        }
	        return null;
	    }

	    // Delete Staff
	    public boolean deleteStaff(Long id) {
	        Staff existingStaff = staffRepository.findById(id).orElse(null);
	        if (existingStaff != null) {
	            staffRepository.deleteById(id);
	            return true;
	        }
	        return false;
	    }
}
