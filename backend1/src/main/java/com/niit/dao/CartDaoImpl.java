package com.niit.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Cart;

@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void saveCart(Cart cart) {
		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = (Transaction) session.beginTransaction();
			session.saveOrUpdate(cart);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateCart(Cart cart) {
		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = (Transaction) session.beginTransaction();
			session.update(cart);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delteCart(Cart cart) {
		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = (Transaction) session.beginTransaction();
			session.delete(cart);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Cart getCartByUserId(int id) {
		Cart cart;
		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = (Transaction) session.beginTransaction();
			cart = session.createQuery("FROM Cart WHERE USER_ID = :id", Cart.class).setParameter("id", id)
					.getSingleResult();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			cart = null;
		}

		return cart;
	}

}
