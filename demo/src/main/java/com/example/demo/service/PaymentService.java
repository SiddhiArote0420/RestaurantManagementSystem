package com.example.demo.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.model.Payment;
import com.example.demo.repository.PaymentRepository;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }

    public boolean addPayment(Payment payment) {
        return paymentRepository.addPayment(payment) > 0;
    }

    public boolean updatePayment(int id, Payment payment) {
        return paymentRepository.updatePayment(id, payment) > 0;
    }

    public boolean deletePayment(int id) {
        return paymentRepository.deletePayment(id) > 0;
    }
}
