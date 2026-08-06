package com.example.demo.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.demo.model.RestaurantTable;
import com.example.demo.service.TableService;
@RestController
@RequestMapping("/api/tables")
@CrossOrigin(origins = "*")
public class TableController {
    @Autowired
    private TableService tableService;
    @GetMapping("/all")
    public List<RestaurantTable> getAllTables() { return tableService.getAllTables(); }
    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> addTable(@RequestBody RestaurantTable table) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = tableService.addTable(table);
            if (success) {
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "Failed to add table");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }
    @PutMapping("/update/{id}")
    public ResponseEntity<Map<String, Object>> updateTable(@PathVariable int id, @RequestBody RestaurantTable table) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = tableService.updateTable(id, table);
            if (success) {
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "Failed to update");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }
    
    @PutMapping("/updateStatus/{id}")
    public ResponseEntity<Map<String, Object>> updateTableStatus(@PathVariable int id, @RequestParam String status, @RequestParam(required=false) Integer staffId) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = tableService.updateStatus(id, status, staffId);
            if (success) {
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "Failed to update status");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }
    
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Map<String, Object>> deleteTable(@PathVariable int id) {
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = tableService.deleteTable(id);
            if (success) {
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "Failed to delete");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }
}
