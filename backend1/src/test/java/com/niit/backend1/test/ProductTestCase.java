package com.niit.backend1.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;



import org.hibernate.annotations.SelectBeforeUpdate;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;

public class ProductTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static ProductDao productDao;
	private static CategoryDao categoryDao;
	
	private Product product;
	
	@BeforeClass
	public static void init() {
		context =new  AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		productDao=(ProductDao)context.getBean("productDao");
		categoryDao=(CategoryDao)context.getBean("categoryDao");
	}
	
	/*@Test
	public void testaddProduct() {
		product=new Product();
		product.setId(0);
		product.setName("Trimmer");
		product.setDescription("It is a trimmer");
		product.setPrice(2500);
		product.setQuantity(10);
		
		Category category = new Category();
		category.setId(7);
		category.setName("Electronicsitems");
		
		product.setCategory(category);
		
		
		assertEquals("Product successfully saved.",true,productDao.addProduct(product));	
	}*/
	
	
	/*@Test
	public void testeditProduct() {
		product=new Product();
		product.setId(5);
		product.setName("philipstrimmer");
		product.setQuantity(1);
		product.setColor("black");
		product.setDescription("Durapowerbattery");
		
		assertEquals("Product updated successfully", true, productDao.editProduct(product));
	}*/
	
	@Test
	public void testgetProduct() {
		
		product=productDao.getProductById(8);
		System.out.println("Product ->"+product.getName()+"  "+product.getCategory().getName());
		assertEquals("Successfully added", "Trimmer", product.getName());
		
	}

}
