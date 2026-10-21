package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendStaffCredentials(String toEmail, String name, String rawPassword, String role) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("dummy.restaurant.mail@gmail.com");
            message.setTo(toEmail);
            message.setSubject("Welcome to Royal Spoon - Your Credentials");
            message.setText("Dear " + name + ",\n\n"
                    + "Welcome to the Royal Spoon Restaurant Management System!\n"
                    + "Your account has been created with the role: " + role + ".\n\n"
                    + "Here are your login credentials:\n"
                    + "Email: " + toEmail + "\n"
                    + "Password: " + rawPassword + "\n\n"
                    + "Please keep this information secure.\n\n"
                    + "Best regards,\n"
                    + "Royal Spoon Admin");
            
            mailSender.send(message);
            log.info("Credentials email sent successfully to {}", toEmail);
        } catch (Exception e) {
            log.error("Failed to send email to {}: {}", toEmail, e.getMessage());
        }
    }
}
