package com.example.demo.dto;

import com.example.demo.entity.Staff;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StaffResponseDTO {
    private Long staffId;
    private String name;
    private String email;
    private String role;

    public static StaffResponseDTO fromEntity(Staff staff) {
        if (staff == null) {
            return null;
        }
        return new StaffResponseDTO(
                staff.getStaffId(),
                staff.getName(),
                staff.getEmail(),
                staff.getRole()
        );
    }
}