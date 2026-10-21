package com.example.demo.entity;

import java.math.BigDecimal;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    private Integer paymentId;
    private Integer orderId;
    private BigDecimal amountPaid;
    private String paymentMode;
    private Date paymentDate;
}
