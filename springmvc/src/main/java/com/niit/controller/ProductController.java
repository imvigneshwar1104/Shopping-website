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
public class ProductController {
	
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
	
	@RequestMapping(value = { "/productPage" })
	public String getProductPage(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryDao.getAllCategories());
		model.addAttribute("products", productDao.getAllProducts());

		return "product";
	}

	@RequestMapping(value = "/admin/product", method = RequestMethod.POST)
	public String productdetails(@Valid @ModelAttribute("product") Product product, BindingResult results, Model model,
			HttpServletRequest request) {
		if (results.hasErrors()) {
			model.addAttribute("product", product);
			model.addAttribute("categories", categoryDao.getAllCategories());
			model.addAttribute("products", productDao.getAllProducts());
			return "product";
		}

		productDao.addProduct(product);
		System.out.println("Hello");

		return "redirect:/productPage";

	}

	@RequestMapping(value = { "/userproductPage" })
	public String getuserproductPage(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryDao.getAllCategories());
		model.addAttribute("products", productDao.getAllProducts());

		return "userproduct";
	}

	@RequestMapping(value = "/upload/{id}", method = RequestMethod.POST)
	public String upload(@ModelAttribute("product") Product product, @PathVariable("id") int id, Model model,
			HttpServletRequest request) {

		MultipartFile file = product.getImage();

		String dir = session.getServletContext().getRealPath("/images");

		File fileDir = new File(dir);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}

		String path = dir + File.separator + id + ".jpg";
		System.out.println("Path set ->" + path);
		File imageFile = new File(path);

		try {
			file.transferTo(imageFile);
			System.out.println("Image transferred to -> " + imageFile.getAbsolutePath());
		}

		catch (IOException e) {

			e.printStackTrace();
		}

		System.out.println("print");

		return "redirect:/productPage";

	}

	@RequestMapping(value = "/admin/delete")
	public String productdelete(@PathParam("id") Product product) {

		productDao.deleteProduct(product);
		return "redirect:/productPage";

	}

	@RequestMapping(value = "/trash")
	public String categorydelete(@PathParam("id") Category category) {

		categoryDao.deleteCategory(category);
		return "redirect:/categoryPage";
	}

	@RequestMapping(value = "/admin/update")
	public String productupdate(@PathParam("id") Product product, Model model) {

		product = productDao.getProductById(product.getId());

		model.addAttribute("product", product);
		model.addAttribute("categories", categoryDao.getAllCategories());
		model.addAttribute("products", productDao.getAllProducts());

		System.out.println("cool");

		return "product";
	}

	@RequestMapping(value = "/edit")
	public String categoryedit(@PathParam("id") Category category, Model model) {
		category = categoryDao.getCategoryById(category.getId());

		model.addAttribute("category", category);
		model.addAttribute("categories", categoryDao.getAllCategories());
		return "categories";

	}

	@RequestMapping(value = "/get")
	public String getProduct(@PathParam("id") int id, Model model) {

		model.addAttribute("proId", id);
		model.addAttribute("product", new Product());

		return "image";
	}

	@RequestMapping(value = { "/categoryPage" })
	public String getCategoryPage(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("categories", categoryDao.getAllCategories());
		return "categories";
	}

	@RequestMapping(value = "/category", method = RequestMethod.POST)
	public String category(@Valid @ModelAttribute("category") Category category, BindingResult results, Model model) {

		if (results.hasErrors()) {
			model.addAttribute("category", category);
			model.addAttribute("categories", categoryDao.getAllCategories());
			return "categories";
		}
		categoryDao.addCategory(category);
		return "redirect:/categoryPage";
	}

	@RequestMapping(value = { "/usercategoryPage" })
	public String getuserCategoryPage(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("categories", categoryDao.getAllCategories());
		return "usercategory";
	}

	@RequestMapping(value = { "/showProduct/{id}" })
	public String getProductById(@PathVariable int id, Model model) {
		Product product = productDao.getProductById(id);

		model.addAttribute("product", product);
		return "showProduct";
	}

}



