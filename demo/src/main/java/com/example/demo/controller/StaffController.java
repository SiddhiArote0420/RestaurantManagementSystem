package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.entity.Staff;
import com.example.demo.service.StaffService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/staff")
@CrossOrigin(origins = "*")
public class StaffController {

	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	@Autowired
	private StaffService staffService;

	@PostMapping("/add")
	public ResponseEntity<?> addStaff(@RequestBody Staff staff) {
		try {
			Staff savedStaff = staffService.addStaff(staff);
			logger.info("New staff added successfully");
			return ResponseEntity.ok(savedStaff);
		} catch (Exception e) {
			logger.error("Something went wrong", e);
			Map<String, String> response = new HashMap<>();
			response.put("error", "Failed to add staff");
			return ResponseEntity.status(500).body(response);
		}
	}

	@GetMapping("/all")
	public List<Staff> getAllStaff() {
		return staffService.getAllStaff();
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> updateStaff(@PathVariable Long id, @RequestBody Staff staffDetails) {
		Staff updated = staffService.updateStaff(id, staffDetails);
		if (updated != null) {
			return ResponseEntity.ok(updated);
		}
		Map<String, String> response = new HashMap<>();
		response.put("error", "Staff not found");
		return ResponseEntity.status(404).body(response);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteStaff(@PathVariable Long id) {
		boolean isDeleted = staffService.deleteStaff(id);
		Map<String, String> response = new HashMap<>();
		if (isDeleted) {
			response.put("message", "Staff deleted successfully");
			return ResponseEntity.ok(response);
		}
		response.put("error", "Staff not found");
		return ResponseEntity.status(404).body(response);
	}
}
