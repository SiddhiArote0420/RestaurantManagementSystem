package com.example.demo.security;

import com.example.demo.dto.StaffResponseDTO;
import com.example.demo.entity.Staff;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import static org.junit.jupiter.api.Assertions.*;

public class JwtSecurityTest {

    private final String secret = "RestaurantManagementSystemSecretKey2026SecureKeyForJwtSigning!";

    private JwtUtil createJwtUtil() {
        JwtUtil util = new JwtUtil();
        ReflectionTestUtils.setField(util, "secret", secret);
        util.init();
        return util;
    }

    @Test
    public void testTokenGenerationAndVerification() {
        JwtUtil jwtUtil = createJwtUtil();
        String token = jwtUtil.generateToken("admin@example.com", "ADMIN", 1);
        assertNotNull(token);
        assertEquals("admin@example.com", jwtUtil.extractUsername(token));
        assertEquals("ADMIN", jwtUtil.extractRole(token));
        assertEquals(1, jwtUtil.extractStaffId(token));
        assertTrue(jwtUtil.validateToken(token, "admin@example.com"));
    }

    @Test
    public void testFixedSecretSurvivesRestart() {
        JwtUtil firstRun = createJwtUtil();
        String token = firstRun.generateToken("waiter@example.com", "WAITER", 2);

        // Simulate backend restart by instantiating new JwtUtil with the same secret
        JwtUtil restartedRun = createJwtUtil();
        assertTrue(restartedRun.validateToken(token, "waiter@example.com"));
        assertEquals("WAITER", restartedRun.extractRole(token));
    }

    @Test
    public void testStaffResponseDTOExcludesPassword() {
        Staff staff = new Staff(10L, "John", "john@example.com", "hashed_password_xyz", "WAITER");
        StaffResponseDTO dto = StaffResponseDTO.fromEntity(staff);

        assertEquals(10L, dto.getStaffId());
        assertEquals("John", dto.getName());
        assertEquals("john@example.com", dto.getEmail());
        assertEquals("WAITER", dto.getRole());

        // Verify Class does not have password field
        assertThrows(NoSuchFieldException.class, () -> StaffResponseDTO.class.getDeclaredField("password"));
    }

    public static void main(String[] args) {
        System.out.println("Running JwtSecurityTest assertions...");
        JwtSecurityTest test = new JwtSecurityTest();
        test.testTokenGenerationAndVerification();
        System.out.println("PASSED: testTokenGenerationAndVerification");
        test.testFixedSecretSurvivesRestart();
        System.out.println("PASSED: testFixedSecretSurvivesRestart");
        test.testStaffResponseDTOExcludesPassword();
        System.out.println("PASSED: testStaffResponseDTOExcludesPassword");
        System.out.println("ALL SECURITY ASSERTIONS PASSED SUCCESSFULLY!");
    }
}