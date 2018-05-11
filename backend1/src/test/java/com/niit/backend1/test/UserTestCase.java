package com.niit.backend1.test;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.UserDao;
import com.niit.model.Address;
import com.niit.model.User;

public class UserTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static UserDao userDao;
	private User user;
	
	@BeforeClass
	public static void init() {
		context =new  AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		userDao=(UserDao)context.getBean("userDao");
	}/*
	@Test
	public void testaddUser()
	{
	  user=new User();
	  user.setId(0);
	  user.setUsername("v");
	  user.setPassword("admin");
      user.setEmail("v@gmail.com");
      
      Address address = new Address();
      address.setStreet("TI Cycles Road");
      address.setDoorno(120); 
      address.setState("Tamil Nadu");
      
      List<Address> addresses = new ArrayList<>();
      
      addresses.add(address);
      
      user.setAddresses(addresses);
      assertEquals("Userinfo saved", true, userDao.addUser(user));
      
	}*/
	

	@Test
	public void testgetUser() {
	user=userDao.getUserById(48);
	
	for(Address addr : user.getAddresses()) {
		System.out.println("Address -> "+addr.getDoorno()+", "+addr.getStreet()+","+addr.getPlace());
	}
	
	
	assertEquals("Successfully added", "v",user.getUsername());
		
	}
}

	
	/*@Test
	public void testeditUser() {
		user=userDao.getUserById(48);
	      
	      Address address = new Address();
	      address.setDoorno(43);
	      address.setPlace("trl");
	      address.setCountry("india");
	      
	      List<Address> addresses= user.getAddresses();
	      addresses.add(address);
	      
	      user.setAddresses(addresses);
     assertEquals("userinfoupdated", true, userDao.editUser(user));
		
	}
}*/

