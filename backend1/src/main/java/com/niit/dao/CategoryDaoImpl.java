package com.niit.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.Category;
import com.niit.model.Product;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Category> getAllCategories() {
		Session session = sessionFactory.openSession();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			List<Category> categories = session.createQuery("FROM Category", Category.class).getResultList();
			transaction.commit();
			session.close();
			return categories;
		}

		catch (HibernateException e) {

			e.printStackTrace();
			return new ArrayList<>();
		}
	}

	@Override
	public boolean addCategory(Category category) {

		Session session = sessionFactory.openSession();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			session.saveOrUpdate(category);
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
	public boolean editCategory(Category category) {
		Session session = sessionFactory.openSession();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			session.update(category);
			transaction.commit();
			session.close();
			return true;

		}

		catch (Exception e) {

			e.printStackTrace();
			return false;

		}

	}

	@Override
	public Category getCategoryById(int id) {
		Session session = sessionFactory.openSession();
		Category category = new Category();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			category = session.get(Category.class, id);
			transaction.commit();
			session.close();

			return category;
		} catch (Exception e) {
			e.printStackTrace();
			return new Category();
		}

	}

	@Override
	public boolean deleteCategory(Category category) {
		Session session=sessionFactory.openSession();
		try {
			Transaction transaction=(Transaction)session.beginTransaction();
			session.delete(category);
			transaction.commit();
			session.close();
            return true;
		}
		
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
		
}
