package com.niit.dao;

import com.niit.model.Cart;

public interface CartDao {

	public void saveCart(Cart cart);
	public void updateCart(Cart cart);
	public void delteCart(Cart cart);
	public Cart getCartByUserId(int id);
}
