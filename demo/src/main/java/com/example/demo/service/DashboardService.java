package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.repository.DashboardRepository;
import com.example.demo.repository.StaffRepository;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Service
public class DashboardService {

    @Autowired
    private DashboardRepository dashboardRepository;

    @Autowired
    private StaffRepository staffRepository;

    public Map<String, Object> getDashboardStats() {
        Map<String, Object> response = new HashMap<>();

        // Fetch values via repository
        long staffCount = staffRepository.count();
        Integer todayOrders = dashboardRepository.getTodayOrdersCount();

        response.put("staffCount", staffCount);
        response.put("todayOrders", todayOrders);

        // Calculate sales for the last 7 days (Business Logic)
        List<String> labels = new ArrayList<>();
        List<Double> data = new ArrayList<>();
        
        LocalDate today = LocalDate.now();
        for (int i = 6; i >= 0; i--) {
            LocalDate date = today.minusDays(i);
            String dayOfWeek = date.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.ENGLISH);
            labels.add(dayOfWeek);
            
            Double dailyTotal = dashboardRepository.getDailyTotalSales(date);
            data.add(dailyTotal);
        }

        response.put("graphLabels", labels);
        response.put("graphData", data);

        return response;
    }
}
