package com.example.demo.repository;

import com.example.demo.entity.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class StaffRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Staff> rowMapper = new RowMapper<Staff>() {
        @Override
        public Staff mapRow(ResultSet rs, int rowNum) throws SQLException {
            Staff staff = new Staff();
            staff.setStaffId(rs.getLong("staff_id"));
            staff.setName(rs.getString("name"));
            staff.setEmail(rs.getString("email"));
            staff.setPassword(rs.getString("password"));
            staff.setRole(rs.getString("role"));
            return staff;
        }
    };

    public List<Staff> findAll() {
        String sql = "SELECT * FROM staff";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public Optional<Staff> findById(Long id) {
        String sql = "SELECT * FROM staff WHERE staff_id = ?";
        List<Staff> staffs = jdbcTemplate.query(sql, rowMapper, id);
        return staffs.stream().findFirst();
    }

    public Staff findByEmailAndPassword(String email, String password) {
        String sql = "SELECT * FROM staff WHERE email = ? AND password = ?";
        List<Staff> staffs = jdbcTemplate.query(sql, rowMapper, email, password);
        return staffs.isEmpty() ? null : staffs.get(0);
    }

    public Staff save(Staff staff) {
        if (staff.getStaffId() == null) {
            String sql = "INSERT INTO staff (name, email, password, role) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, staff.getName(), staff.getEmail(), staff.getPassword(), staff.getRole());
            
            Long lastId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class);
            staff.setStaffId(lastId);
        } else {
            String sql = "UPDATE staff SET name = ?, email = ?, password = ?, role = ? WHERE staff_id = ?";
            jdbcTemplate.update(sql, staff.getName(), staff.getEmail(), staff.getPassword(), staff.getRole(), staff.getStaffId());
        }
        return staff;
    }

    public void deleteById(Long id) {
        String sql = "DELETE FROM staff WHERE staff_id = ?";
        jdbcTemplate.update(sql, id);
    }

    public long count() {
        String sql = "SELECT COUNT(*) FROM staff";
        Long count = jdbcTemplate.queryForObject(sql, Long.class);
        return count != null ? count : 0;
    }
}
