package com.example.demo.constant;

public final class SqlQueries {
    private SqlQueries() {} // Prevent instantiation

    // Staff Queries
    public static final String FIND_ALL_STAFF = "SELECT * FROM staff";
    public static final String FIND_STAFF_BY_ID = "SELECT * FROM staff WHERE staff_id = ?";
    public static final String FIND_STAFF_BY_EMAIL = "SELECT * FROM staff WHERE email = ?";
    public static final String INSERT_STAFF = "INSERT INTO staff (name, email, password, role) VALUES (?, ?, ?, ?)";
    public static final String UPDATE_STAFF = "UPDATE staff SET name = ?, email = ?, password = ?, role = ? WHERE staff_id = ?";
    public static final String DELETE_STAFF = "DELETE FROM staff WHERE staff_id = ?";
    public static final String COUNT_STAFF = "SELECT COUNT(*) FROM staff";
    public static final String FIND_STAFF_PAGE = "SELECT * FROM staff LIMIT ? OFFSET ?";

    // Dashboard Queries
    public static final String COUNT_TODAY_ORDERS = "SELECT COUNT(*) FROM orders";
    public static final String GET_DAILY_TOTAL_SALES = "SELECT SUM(amount_paid) FROM payment WHERE payment_date = ?";

    // Menu Queries
    public static final String FIND_ALL_MENU = "SELECT m.food_id, m.food_name, m.price, m.category_id, m.is_available, c.category_name FROM menu m LEFT JOIN category c ON m.category_id = c.category_id";
    public static final String FIND_MENU_BY_ID = FIND_ALL_MENU + " WHERE m.food_id = ?";
    public static final String INSERT_MENU = "INSERT INTO menu (food_name, price, category_id, is_available) VALUES (?, ?, ?, ?)";
    public static final String UPDATE_MENU = "UPDATE menu SET food_name = ?, price = ?, category_id = ?, is_available = ? WHERE food_id = ?";
    public static final String DELETE_MENU = "DELETE FROM menu WHERE food_id = ?";
    public static final String UPDATE_MENU_AVAILABILITY = "UPDATE menu SET is_available = ? WHERE food_id = ?";
}
