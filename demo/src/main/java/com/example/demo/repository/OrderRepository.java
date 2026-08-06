package com.example.demo.repository;

import com.example.demo.dto.OrderDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class OrderRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<OrderDTO> orderDTORowMapper = new RowMapper<OrderDTO>() {
        @Override
        public OrderDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
            OrderDTO dto = new OrderDTO();
            dto.setOrderId(rs.getLong("order_id"));
            dto.setTableId(rs.getInt("table_id"));
            dto.setTotalAmount(rs.getDouble("total_amount"));
            dto.setOverallStatus(rs.getString("overall_status"));
            
            // Try fetching staff name (using LEFT JOIN)
            try {
                dto.setStaffName(rs.getString("name"));
            } catch (SQLException e) {
                dto.setStaffName("Unknown");
            }
            
            return dto;
        }
    };

    public List<OrderDTO> findAllOrdersWithStaffName() {
        String sql = "SELECT o.order_id, o.table_id, o.total_amount, o.overall_status, s.name " +
                     "FROM orders o " +
                     "LEFT JOIN staff s ON o.staff_id = s.staff_id " +
                     "ORDER BY o.order_id DESC";
        return jdbcTemplate.query(sql, orderDTORowMapper);
    }

        public Long createOrder(Integer tableId, Integer staffId, Double totalAmount, String status) {
        String sql = "INSERT INTO orders (table_id, staff_id, total_amount, overall_status) VALUES (?, ?, ?, ?)";
        org.springframework.jdbc.support.KeyHolder keyHolder = new org.springframework.jdbc.support.GeneratedKeyHolder();
        jdbcTemplate.update(connection -> {
            java.sql.PreparedStatement ps = connection.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, tableId);
            ps.setObject(2, staffId);
            ps.setDouble(3, totalAmount != null ? totalAmount : 0.0);
            ps.setString(4, status);
            return ps;
        }, keyHolder);
        return keyHolder.getKey().longValue();
    }

        public void updateOrderStatus(Long orderId, String status) {
        String sql = "UPDATE orders SET overall_status = ? WHERE order_id = ?";
        jdbcTemplate.update(sql, status, orderId);
    }

    public void updateOrderTotalAmount(Long orderId, Double totalAmount) {
        String sql = "UPDATE orders SET total_amount = ? WHERE order_id = ?";
        jdbcTemplate.update(sql, totalAmount, orderId);
    }

    public void deleteOrderById(Long orderId) {
        // First delete details
        jdbcTemplate.update("DELETE FROM order_details WHERE order_id = ?", orderId);
        // Then delete order
        jdbcTemplate.update("DELETE FROM orders WHERE order_id = ?", orderId);
    }
}


