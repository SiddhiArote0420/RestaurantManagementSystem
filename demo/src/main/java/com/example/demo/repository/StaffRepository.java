package com.example.demo.repository;

import com.example.demo.entity.Staff;
import com.example.demo.constant.SqlQueries;
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
        return jdbcTemplate.query(SqlQueries.FIND_ALL_STAFF, rowMapper);
    }

    public List<Staff> findPage(int limit, int offset) {
        return jdbcTemplate.query(SqlQueries.FIND_STAFF_PAGE, rowMapper, limit, offset);
    }

    public Optional<Staff> findById(Long id) {
        List<Staff> staffs = jdbcTemplate.query(SqlQueries.FIND_STAFF_BY_ID, rowMapper, id);
        return staffs.stream().findFirst();
    }

    public Staff findByEmail(String email) {
        List<Staff> staffs = jdbcTemplate.query(SqlQueries.FIND_STAFF_BY_EMAIL, rowMapper, email);
        return staffs.isEmpty() ? null : staffs.get(0);
    }

    public Staff save(Staff staff) {
        if (staff.getStaffId() == null) {
            jdbcTemplate.update(SqlQueries.INSERT_STAFF, staff.getName(), staff.getEmail(), staff.getPassword(), staff.getRole());
            Long lastId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class);
            staff.setStaffId(lastId);
        } else {
            jdbcTemplate.update(SqlQueries.UPDATE_STAFF, staff.getName(), staff.getEmail(), staff.getPassword(), staff.getRole(), staff.getStaffId());
        }
        return staff;
    }

    public void deleteById(Long id) {
        jdbcTemplate.update(SqlQueries.DELETE_STAFF, id);
    }

    public long count() {
        Long count = jdbcTemplate.queryForObject(SqlQueries.COUNT_STAFF, Long.class);
        return count != null ? count : 0;
    }
}
