package com.example.demo.repository;

import com.example.demo.dto.OrderItemDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class OrderDetailRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<OrderItemDTO> orderItemDTORowMapper = new RowMapper<OrderItemDTO>() {
        @Override
        public OrderItemDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
            OrderItemDTO dto = new OrderItemDTO();
            dto.setFoodName(rs.getString("food_name"));
            dto.setQuantity(rs.getInt("quantity"));
            dto.setPrice(rs.getDouble("price"));
            dto.setItemStatus(rs.getString("item_status"));
            return dto;
        }
    };

        public void addOrderItem(Long orderId, Integer foodId, Integer quantity, String status) {
        String sql = "INSERT INTO order_details (order_id, food_id, quantity, item_status) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, orderId, foodId, quantity, status);
    }

    // NEW: Appends item to existing order without touching existing items
    public void addItemsToOrder(Long orderId, Integer foodId, Integer quantity) {
        String sql = "INSERT INTO order_details (order_id, food_id, quantity, item_status) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, orderId, foodId, quantity, "PENDING");
    }

        public void deleteItemsByOrderId(Long orderId) {
        String sql = "DELETE FROM order_details WHERE order_id = ?";
        jdbcTemplate.update(sql, orderId);
    }

    public List<OrderItemDTO> findItemsByOrderId(Long orderId) {
        String sql = "SELECT m.food_name, m.price, od.quantity, od.item_status " +
                     "FROM order_details od " +
                     "JOIN menu m ON od.food_id = m.food_id " +
                     "WHERE od.order_id = ?";
        return jdbcTemplate.query(sql, orderItemDTORowMapper, orderId);
    }
}


