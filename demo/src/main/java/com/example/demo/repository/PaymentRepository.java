package com.example.demo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.example.demo.entity.Payment;

@Repository
public class PaymentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final class PaymentRowMapper implements RowMapper<Payment> {
        @Override
        public Payment mapRow(ResultSet rs, int rowNum) throws SQLException {
            Payment payment = new Payment();
            payment.setPaymentId(rs.getInt("payment_id"));
            payment.setOrderId(rs.getInt("order_id"));
            payment.setAmountPaid(rs.getBigDecimal("amount_paid"));
            payment.setPaymentMode(rs.getString("payment_mode"));
            payment.setPaymentDate(rs.getDate("payment_date"));
            return payment;
        }
    }

    public List<Payment> findAll() {
        String sql = "SELECT * FROM payment ORDER BY payment_date DESC, payment_id DESC";
        return jdbcTemplate.query(sql, new PaymentRowMapper());
    }

    public int addPayment(Payment payment) {
        String sql = "INSERT INTO payment (order_id, amount_paid, payment_mode, payment_date) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, payment.getOrderId(), payment.getAmountPaid(), payment.getPaymentMode(), payment.getPaymentDate());
    }

    public int updatePayment(int id, Payment payment) {
        String sql = "UPDATE payment SET order_id = ?, amount_paid = ?, payment_mode = ?, payment_date = ? WHERE payment_id = ?";
        return jdbcTemplate.update(sql, payment.getOrderId(), payment.getAmountPaid(), payment.getPaymentMode(), payment.getPaymentDate(), id);
    }

    public int deletePayment(int id) {
        String sql = "DELETE FROM payment WHERE payment_id = ?";
        return jdbcTemplate.update(sql, id);
    }
}
