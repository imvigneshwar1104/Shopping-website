package com.niit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addUser(User user) {
		Session session = sessionFactory.openSession();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			session.save(user);
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
	public User getUserById(int id) {
		Session session = sessionFactory.openSession();
		User user = new User();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			user = session.get(User.class, id);
			transaction.commit();
			session.close();
			return user;
		} catch (Exception e) {

			e.printStackTrace();
			return new User();
		}
	}

	@Override
	public boolean editUser(User user) {

		Session session = sessionFactory.openSession();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			session.update(user);
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
	public User getUserByEmail(String email) {
		Session session = sessionFactory.openSession();
		User user = new User();
		try {
			Transaction transaction = (Transaction) session.beginTransaction();
			user = session.createQuery("FROM User WHERE email = :email", User.class).setParameter("email", email)
					.getSingleResult();
			transaction.commit();
			session.close();
			return user;
		} catch (Exception e) {

			e.printStackTrace();
			return new User();
		}
	}
}
