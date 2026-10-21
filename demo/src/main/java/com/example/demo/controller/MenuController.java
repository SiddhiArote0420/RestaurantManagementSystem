package com.example.demo.controller;

import com.example.demo.dto.MenuDTO;
import com.example.demo.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/menu")
public class MenuController {

    private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

    @Autowired
    private MenuService menuService;

    @PutMapping("/{id}/availability")
    @PreAuthorize("hasAnyRole('ADMIN', 'CHEF')")
    public ResponseEntity<String> updateAvailability(@PathVariable Long id, @RequestParam boolean status) {
        try {
            boolean updated = menuService.updateAvailability(id, status);
            if (updated) {
                return ResponseEntity.ok("Availability updated successfully");
            }
            return ResponseEntity.notFound().build();
        } catch (Exception e) {
            logger.error("Error updating availability", e);
            return ResponseEntity.internalServerError().body("Error: " + e.getMessage());
        }
    }

    @GetMapping("/all")
    @PreAuthorize("isAuthenticated()")
    public List<MenuDTO> getAllMenus() {
        return menuService.getAllMenus();
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<MenuDTO> getMenuById(@PathVariable Long id) {
        MenuDTO menu = menuService.getMenuById(id);
        if(menu != null) {
            return ResponseEntity.ok(menu);
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/add")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<?> addMenu(@RequestBody MenuDTO menu) {
        try {
            MenuDTO savedMenu = menuService.addMenu(menu);
            logger.info("New menu added successfully");
            return ResponseEntity.ok(savedMenu);
        } catch (Exception e) {
            logger.error("Something went wrong", e);
            return ResponseEntity.status(500).body("Failed to add menu");
        }
    }

    @PutMapping("/update/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<MenuDTO> updateMenu(@PathVariable Long id, @RequestBody MenuDTO menuDetails) {
        MenuDTO updatedMenu = menuService.updateMenu(id, menuDetails);
        if (updatedMenu != null) {
            return ResponseEntity.ok(updatedMenu);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteMenu(@PathVariable Long id) {
        menuService.deleteMenu(id);
        return ResponseEntity.ok().build();
    }
}

