package com.niit.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Product;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Product> getAllProducts() {
		Session session=sessionFactory.openSession();
		try {
			Transaction transaction=(Transaction)session.beginTransaction();
			List<Product> products=session.createQuery("FROM Product",Product.class).getResultList();
			transaction.commit();
			session.close();
			return products;
		}
		catch (HibernateException e) {
			// TODO: handle exception
		e.printStackTrace();
		return new ArrayList<>();
		}
	}

	@Override
	public boolean addProduct(Product product) {

		Session session = sessionFactory.openSession();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			session.saveOrUpdate(product);
			transaction.commit();
			session.close();
			return true;
		}

		catch (HibernateException e) {

			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean editProduct(Product product) {
		Session session=sessionFactory.openSession();
		try {
			Transaction transaction=(Transaction)session.beginTransaction();
			session.saveOrUpdate(product);
			transaction.commit();
			session.close();
			return true;
		}
		
		catch(HibernateException e){
			e.printStackTrace();
			return false;
			
			
			
		}
	}

	
	

	@Override
	public Product getProductById(int id) {
		Session session=sessionFactory.openSession();
		Product product = new Product();
		try {
			Transaction transaction=(Transaction)session.beginTransaction();
			product = session.get(Product.class, id);
			transaction.commit();
			session.close();
		
		return product;
	}
		catch (Exception e) {
		e.printStackTrace();
		return new Product();
	}

}

	@Override
	public boolean deleteProduct(Product product) {
	  Session session=sessionFactory.openSession();
	  try {
		  Transaction transaction=(Transaction)session.beginTransaction();
		  System.out.println(product.getName());
		  session.delete(product);
		  transaction.commit();
		  session.close();
		  return true;
		  
	  }
	  
	  catch (HibernateException e) {
		  e.printStackTrace();
		  return false;
	  }
		
	}
	
}
