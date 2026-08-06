package com.example.demo.repository;

import com.example.demo.entity.Category;
import com.example.demo.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class MenuRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Menu> rowMapper = new RowMapper<Menu>() {
        @Override
        public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
            Menu menu = new Menu();
            menu.setMenuId(rs.getLong("food_id"));
            menu.setName(rs.getString("food_name"));
            menu.setPrice(rs.getDouble("price"));
            
            Category category = new Category();
            category.setCategoryId(rs.getInt("category_id"));
            // We might not have category_name here if not joined, but let's assume we do if we use JOIN
            try {
                category.setCategoryName(rs.getString("category_name"));
            } catch(SQLException e) {
                // category_name column might not exist if simple SELECT
            }
            menu.setCategory(category);
            
            return menu;
        }
    };

    public List<Menu> findAll() {
        String sql = "SELECT m.food_id, m.food_name, m.price, m.category_id, c.category_name " +
                     "FROM menu m LEFT JOIN category c ON m.category_id = c.category_id";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public Optional<Menu> findById(Long id) {
        String sql = "SELECT m.food_id, m.food_name, m.price, m.category_id, c.category_name " +
                     "FROM menu m LEFT JOIN category c ON m.category_id = c.category_id " +
                     "WHERE m.food_id = ?";
        List<Menu> menus = jdbcTemplate.query(sql, rowMapper, id);
        return menus.stream().findFirst();
    }

    public Menu save(Menu menu) {
        if (menu.getMenuId() == null) {
            String sql = "INSERT INTO menu (food_name, price, category_id) VALUES (?, ?, ?)";
            jdbcTemplate.update(sql, menu.getName(), menu.getPrice(), menu.getCategory().getCategoryId());
            
            // Get the last inserted ID
            Long lastId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class);
            menu.setMenuId(lastId);
        } else {
            String sql = "UPDATE menu SET food_name = ?, price = ?, category_id = ? WHERE food_id = ?";
            jdbcTemplate.update(sql, menu.getName(), menu.getPrice(), menu.getCategory().getCategoryId(), menu.getMenuId());
        }
        return menu;
    }

    public void deleteById(Long id) {
        String sql = "DELETE FROM menu WHERE food_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
