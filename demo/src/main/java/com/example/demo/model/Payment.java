package com.example.demo.model;

import java.math.BigDecimal;
import java.util.Date;

public class Payment {

    private Integer paymentId;
    private Integer orderId;
    private BigDecimal amountPaid;
    private String paymentMode;
    private Date paymentDate;

    public Payment() {
    }

    public Payment(Integer paymentId, Integer orderId, BigDecimal amountPaid, String paymentMode, Date paymentDate) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.amountPaid = amountPaid;
        this.paymentMode = paymentMode;
        this.paymentDate = paymentDate;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
}
