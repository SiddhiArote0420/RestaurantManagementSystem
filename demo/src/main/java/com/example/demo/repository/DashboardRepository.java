package com.example.demo.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;

import com.example.demo.constant.SqlQueries;

@Repository
public class DashboardRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Integer getTodayOrdersCount() {
        Integer count = jdbcTemplate.queryForObject(SqlQueries.COUNT_TODAY_ORDERS, Integer.class);
        return (count != null) ? count : 0;
    }

    public Double getDailyTotalSales(LocalDate date) {
        Double dailyTotal = jdbcTemplate.queryForObject(
            SqlQueries.GET_DAILY_TOTAL_SALES, 
            Double.class, 
            date
        );
        return (dailyTotal != null) ? dailyTotal : 0.0;
    }
}
