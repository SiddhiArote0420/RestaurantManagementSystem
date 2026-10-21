package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.example.demo.dto.PaginatedResponse;
import com.example.demo.dto.StaffResponseDTO;
import com.example.demo.entity.Staff;
import com.example.demo.service.StaffService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/staff")
public class StaffController {

	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	@Autowired
	private StaffService staffService;

	@PostMapping("/add")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> addStaff(@Valid @RequestBody Staff staff) {
		try {
			Staff savedStaff = staffService.addStaff(staff);
			logger.info("New staff added successfully");
			return ResponseEntity.ok(StaffResponseDTO.fromEntity(savedStaff));
		} catch (Exception e) {
			logger.error("Something went wrong", e);
			Map<String, String> response = new HashMap<>();
			response.put("error", "Failed to add staff");
			return ResponseEntity.status(500).body(response);
		}
	}

	@GetMapping("/all")
	@PreAuthorize("hasAnyRole('ADMIN', 'RECEPTIONIST')")
	public List<StaffResponseDTO> getAllStaff() {
		return staffService.getAllStaff().stream()
				.map(StaffResponseDTO::fromEntity)
				.collect(Collectors.toList());
	}

	@GetMapping("/page")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<PaginatedResponse<StaffResponseDTO>> getStaffPage(
			@RequestParam(defaultValue = "1") int page, 
			@RequestParam(defaultValue = "5") int size) {
		PaginatedResponse<Staff> pageResult = staffService.getStaffPage(page, size);
		List<StaffResponseDTO> dtoList = pageResult.getData().stream()
				.map(StaffResponseDTO::fromEntity)
				.collect(Collectors.toList());
		return ResponseEntity.ok(new PaginatedResponse<>(dtoList, pageResult.getCurrentPage(), pageResult.getTotalPages(), pageResult.getTotalItems()));
	}

	@PutMapping("/update/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> updateStaff(@PathVariable Long id, @Valid @RequestBody Staff staffDetails) {
		Staff updated = staffService.updateStaff(id, staffDetails).orElse(null);
		if (updated != null) {
			return ResponseEntity.ok(StaffResponseDTO.fromEntity(updated));
		}
		Map<String, String> response = new HashMap<>();
		response.put("error", "Staff not found");
		return ResponseEntity.status(404).body(response);
	}

	@DeleteMapping("/delete/{id}")
	@PreAuthorize("hasRole('ADMIN')")
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

