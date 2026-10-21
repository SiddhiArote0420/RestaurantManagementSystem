package com.example.demo.service;

import com.example.demo.dto.MenuDTO;
import com.example.demo.entity.Category;
import com.example.demo.entity.Menu;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class MenuService {

    @Autowired
    private MenuRepository menuRepository;
    
    @Autowired
    private CategoryRepository categoryRepository;

    public List<MenuDTO> getAllMenus() {
        return menuRepository.findAll().stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    public MenuDTO getMenuById(Long id) {
        return menuRepository.findById(id).map(this::convertToDTO).orElse(null);
    }

    public MenuDTO addMenu(MenuDTO dto) {
        Menu menu = new Menu();
        menu.setName(dto.getName());
        menu.setPrice(dto.getPrice());
        
        Optional<Category> categoryOpt = categoryRepository.findByCategoryName(dto.getCategory());
        if(categoryOpt.isPresent()) {
            menu.setCategory(categoryOpt.get());
        } else {
            // Default to Starters if not found or save new category (but we just pre-populated them)
            Category newCategory = new Category();
            newCategory.setCategoryName(dto.getCategory());
            categoryRepository.save(newCategory);
            menu.setCategory(newCategory);
        }
        
        return convertToDTO(menuRepository.save(menu));
    }

    public MenuDTO updateMenu(Long id, MenuDTO dto) {
        Optional<Menu> optionalMenu = menuRepository.findById(id);
        if (optionalMenu.isPresent()) {
            Menu existingMenu = optionalMenu.get();
            existingMenu.setName(dto.getName());
            existingMenu.setPrice(dto.getPrice());
            
            Optional<Category> categoryOpt = categoryRepository.findByCategoryName(dto.getCategory());
            if(categoryOpt.isPresent()) {
                existingMenu.setCategory(categoryOpt.get());
            } else {
                Category newCategory = new Category();
                newCategory.setCategoryName(dto.getCategory());
                categoryRepository.save(newCategory);
                existingMenu.setCategory(newCategory);
            }
            return convertToDTO(menuRepository.save(existingMenu));
        }
        return null;
    }
    

    public boolean updateAvailability(Long id, boolean available) {
        int rows = menuRepository.updateAvailability(id, available);
        return rows > 0;
    }

    public void deleteMenu(Long id) {
        menuRepository.deleteById(id);
    }
    
    private MenuDTO convertToDTO(Menu menu) {
        return new MenuDTO(
            menu.getMenuId(), 
            menu.getName(), 
            menu.getCategory() != null ? menu.getCategory().getCategoryName() : "Unknown", 
            menu.getPrice(),
            menu.isAvailable()
        );
    }
}
