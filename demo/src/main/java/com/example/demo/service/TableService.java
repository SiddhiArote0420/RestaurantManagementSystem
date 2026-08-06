package com.example.demo.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.model.RestaurantTable;
import com.example.demo.repository.TableRepository;
@Service
public class TableService {
    @Autowired
    private TableRepository tableRepository;
    public List<RestaurantTable> getAllTables() { return tableRepository.findAll(); }
    public boolean addTable(RestaurantTable table) { return tableRepository.addTable(table) > 0; }
    public boolean updateTable(int id, RestaurantTable table) { return tableRepository.updateTable(id, table) > 0; }
    public boolean updateStatus(int id, String status, Integer staffId) { return tableRepository.updateStatus(id, status, staffId) > 0; }
    public boolean deleteTable(int id) { return tableRepository.deleteTable(id) > 0; }
}
