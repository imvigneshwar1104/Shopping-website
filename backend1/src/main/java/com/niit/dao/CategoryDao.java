package com.niit.dao;
import java.util.List;

import com.niit.model.Category;

public interface CategoryDao {
	
	List<Category> getAllCategories();
    
	boolean addCategory(Category category);
	boolean editCategory(Category category);
	Category getCategoryById(int id);
	boolean deleteCategory(Category category);
}
