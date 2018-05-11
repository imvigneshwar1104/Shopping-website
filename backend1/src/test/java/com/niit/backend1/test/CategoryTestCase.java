package com.niit.backend1.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.CategoryDao;
import com.niit.model.Category;

public class CategoryTestCase {
	
private static AnnotationConfigApplicationContext context;
	
	private static CategoryDao categoryDao;
	
	private Category category;
	
	@BeforeClass
	public static void init() {
		context =new  AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		categoryDao=(CategoryDao)context.getBean("categoryDao");

}
	/*@Test
	public void testaddCategory() {
		category=new Category();
		category.setId(0);
         category.setName("Electronics");
		assertEquals("Category saved", true, categoryDao.addCategory(category));
	}*/
	
	@Test
	public void testeditCategory() {
		category=new Category();
		category.setId(7);
		category.setName("Electronicsitems");
		assertEquals("Categoryupdated", true, categoryDao.editCategory(category));
	}
	
	
}
