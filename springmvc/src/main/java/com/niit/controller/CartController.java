package com.niit.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.CartDao;
import com.niit.dao.ProductDao;
import com.niit.dao.UserDao;
import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Product;
import com.niit.model.User;

import javassist.expr.Instanceof;

@Controller
public class CartController {

	@Autowired
	User user;

	@Autowired
	UserDao userDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	CartDao cartDao;

	@RequestMapping("/user/cart")
	public String showCart(Principal principal,Model model) {

		User user = userDao.getUserByEmail(principal.getName());
		model.addAttribute("cart", cartDao.getCartByUserId(user.getId()));
		return "cart";
	}

	@RequestMapping("/user/addToCart/{id}")
	public String addToCart(@PathVariable int id, Principal principal) {

		Product product = productDao.getProductById(id);

		String username = principal.getName();

		User user = userDao.getUserByEmail(username);

		List<CartItem> cartItems = new ArrayList<>();
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);

		Cart cart;
		cart = cartDao.getCartByUserId(user.getId());
		if (cart == null) {
			System.out.println("Cart is null");
			cart = new Cart();
			cart.setUser(user);
			cartItem.setQty(1);
			cartItem.setSubTotal((int) product.getPrice());
			cartItems.add(cartItem);
			cart.setCartItems(cartItems);
			cart.setGrandTotal(cartItem.getSubTotal());
			
		} else {
			
			boolean found = false;
			cartItems = cart.getCartItems();
			for (CartItem ci : cartItems) {
				if(ci.getProduct().getId() == cartItem.getProduct().getId()) {
					ci.setQty(ci.getQty() + 1);
					ci.setSubTotal(ci.getSubTotal() + (int)product.getPrice());
					found=true;
					break;
				}
			}
			
			if(!found) {
				cartItem.setQty(cartItem.getQty() + 1);
				cartItem.setSubTotal(cartItem.getSubTotal() + (int)product.getPrice());
				cartItems.add(cartItem);
			}
			
			cart.setCartItems(cartItems);
			cart.setGrandTotal(cart.getGrandTotal() + (int)product.getPrice());
		}
		
		cartDao.saveCart(cart);

		return "redirect:/user/cart";

	}
	

	@RequestMapping("/user/delete/{id}")
	public String deleteCartItem(@PathVariable int id, Principal principal) {

		User user = userDao.getUserByEmail(principal.getName());

		List<CartItem> cartItems;
		
		Cart cart = cartDao.getCartByUserId(user.getId());
		
		cartItems = cart.getCartItems();
		CartItem cartItem = new CartItem();
		
		for (CartItem ci : cartItems) {
			if(ci.getId() == id) {
				cartItem = ci;
			}
		}
		
		cartItems.remove(cartItem);
		cart.setCartItems(cartItems);
		cart.setGrandTotal(cart.getGrandTotal() - cartItem.getSubTotal());
		
		cartDao.saveCart(cart);
		
		return "redirect:/user/cart";
	}
	
	@RequestMapping(value= {"/showmsg"})
	public String getsuccess(Model model) {
		return "Success";
	}

}
