package com.example.demo.repository;

import com.example.demo.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class CategoryRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Category> rowMapper = new RowMapper<Category>() {
        @Override
        public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
            Category category = new Category();
            category.setCategoryId(rs.getInt("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            return category;
        }
    };

    public Optional<Category> findByCategoryName(String categoryName) {
        String sql = "SELECT * FROM category WHERE category_name = ?";
        List<Category> categories = jdbcTemplate.query(sql, rowMapper, categoryName);
        return categories.stream().findFirst();
    }

    public Category save(Category category) {
        String sql = "INSERT INTO category (category_name) VALUES (?)";
        jdbcTemplate.update(sql, category.getCategoryName());
        
        // Fetch the inserted category to get the ID
        return findByCategoryName(category.getCategoryName()).orElse(category);
    }
}
