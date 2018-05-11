package com.niit.dao;
import java.util.List;

import com.niit.model.User;

public interface UserDao {
	
	List<User> getAllUsers();
	
	boolean addUser(User user);
	User getUserById(int id);
    boolean editUser(User user);
    User getUserByEmail(String email);

}
