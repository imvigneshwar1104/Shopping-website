package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.UserDao;
import com.niit.model.Address;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class PageController {

	@Autowired
	UserDao userDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	User user;

	@Autowired
	HttpSession session;

	@RequestMapping(value = { "/", "/home", "/index" })
	public String getDefaultPage() {

		return "index";

	}

	@RequestMapping(value = { "/loginPage" })
	public String getLoginPage() {

		return "login";
	}

	@RequestMapping(value = { "/logout" })
	public String getLogoutPage() {

		return "logout";
	}

	@RequestMapping(value = "/registerPage", method = RequestMethod.GET)
	public String getRegisterPage(Model model) {

		model.addAttribute("user", new User());

		return "register";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user, BindingResult results, Model model) {

		if (results.hasErrors()) {
			model.addAttribute("user", user);
			return "register";

		}

		this.user = user;

		model.addAttribute("address", new Address());
		return "address";
	}

	@RequestMapping(value = "/address", method = RequestMethod.POST)
	public String register(@Valid @ModelAttribute("address") Address address, BindingResult results, Model model,
			User user) {

		if (results.hasErrors()) {
			model.addAttribute("address", address);
			return "address";

		}

		List<Address> c = new ArrayList<>();
		c.add(address);
		this.user.setAddresses(c);

		this.user.setRole("ROLE_USER");
		this.user.setEnabled(true);
		userDao.addUser(this.user);

		return "redirect:/home";

	}
}

	
/*
 * @RequestMapping("/fileupload") public String
 * uploadResources(HttpServletRequest servletRequest, @ModelAttribute Product
 * product, Model model) { List<MultipartFile> files = product.getImages();
 * List<String> fileNames = new ArrayList<String>(); if (null != files &&
 * files.size() > 0) { for (MultipartFile multipartFile : files) {
 * 
 * String fileName = multipartFile.getOriginalFilename();
 * fileNames.add(fileName);
 * 
 * File imageFile = new
 * File(servletRequest.getServletContext().getRealPath("/images"), fileName);
 * 
 * try { multipartFile.transferTo(imageFile); }
 * 
 * catch (IOException e) {
 * 
 * e.printStackTrace(); }
 * 
 * } }
 * 
 * model.addAttribute("product", product); return ""; }
 */
