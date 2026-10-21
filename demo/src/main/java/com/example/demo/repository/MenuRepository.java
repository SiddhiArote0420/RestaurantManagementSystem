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

import com.example.demo.constant.SqlQueries;

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
            
            try {
                menu.setAvailable(rs.getBoolean("is_available"));
            } catch(SQLException e) {
                // Ignore if not present
            }
            
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
        return jdbcTemplate.query(SqlQueries.FIND_ALL_MENU, rowMapper);
    }

    public Optional<Menu> findById(Long id) {
        List<Menu> menus = jdbcTemplate.query(SqlQueries.FIND_MENU_BY_ID, rowMapper, id);
        return menus.stream().findFirst();
    }

    public Menu save(Menu menu) {
        if (menu.getMenuId() == null) {
            jdbcTemplate.update(SqlQueries.INSERT_MENU, menu.getName(), menu.getPrice(), menu.getCategory().getCategoryId(), menu.isAvailable());
            
            // Get the last inserted ID
            Long lastId = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class);
            menu.setMenuId(lastId);
        } else {
            jdbcTemplate.update(SqlQueries.UPDATE_MENU, menu.getName(), menu.getPrice(), menu.getCategory().getCategoryId(), menu.isAvailable(), menu.getMenuId());
        }
        return menu;
    }

    public int updateAvailability(Long id, boolean available) {
        return jdbcTemplate.update(SqlQueries.UPDATE_MENU_AVAILABILITY, available, id);
    }

    public void deleteById(Long id) {
        jdbcTemplate.update(SqlQueries.DELETE_MENU, id);
    }
}
