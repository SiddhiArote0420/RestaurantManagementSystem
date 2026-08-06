package com.example.demo.repository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.example.demo.model.RestaurantTable;

@Repository
public class TableRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final class TableRowMapper implements RowMapper<RestaurantTable> {
        @Override
        public RestaurantTable mapRow(ResultSet rs, int rowNum) throws SQLException {
            RestaurantTable table = new RestaurantTable();
            table.setTableId(rs.getInt("table_id"));
            table.setTableNumber(rs.getInt("table_number"));
            table.setStatus(rs.getString("status"));
            
            // Read assigned_staff_id, allowing null
            int staffId = rs.getInt("assigned_staff_id");
            table.setAssignedStaffId(rs.wasNull() ? null : staffId);
            
            // Read customer_count, allowing null
            int custCount = rs.getInt("customer_count");
            table.setCustomerCount(rs.wasNull() ? null : custCount);
            
            return table;
        }
    }

    public List<RestaurantTable> findAll() {
        String sql = "SELECT * FROM restaurant_table ORDER BY table_number ASC";
        return jdbcTemplate.query(sql, new TableRowMapper());
    }

    public int addTable(RestaurantTable table) {
        String sql = "INSERT INTO restaurant_table (table_number, status, assigned_staff_id, customer_count) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, table.getTableNumber(), table.getStatus(), table.getAssignedStaffId(), table.getCustomerCount());
    }

    public int updateTable(int tableId, RestaurantTable table) {
        String sql = "UPDATE restaurant_table SET table_number = ?, status = ?, assigned_staff_id = ?, customer_count = ? WHERE table_id = ?";
        return jdbcTemplate.update(sql, table.getTableNumber(), table.getStatus(), table.getAssignedStaffId(), table.getCustomerCount(), tableId);
    }

    public int updateStatus(int tableId, String status, Integer staffId) {
        if (staffId == null || staffId == 0) {
            String sql = "UPDATE restaurant_table SET status = ?, assigned_staff_id = NULL WHERE table_id = ?";
            return jdbcTemplate.update(sql, status, tableId);
        } else {
            String sql = "UPDATE restaurant_table SET status = ?, assigned_staff_id = ? WHERE table_id = ?";
            return jdbcTemplate.update(sql, status, staffId, tableId);
        }
    }

    public int deleteTable(int tableId) {
        String sql = "DELETE FROM restaurant_table WHERE table_id = ?";
        return jdbcTemplate.update(sql, tableId);
    }
}
