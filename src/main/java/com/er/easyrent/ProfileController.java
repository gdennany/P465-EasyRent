package com.er.easyrent;

import com.er.easyrent.models.Category;
import com.er.easyrent.models.HasViewed;
import com.er.easyrent.models.Product;
import com.er.easyrent.repos.CategoryRepository;
import com.er.easyrent.repos.ProductRepository;
import com.er.easyrent.repos.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ProfileController {
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductRepository productRepository;

	@Autowired
	UserRepository fUserRepository;

	@RequestMapping("/profile")
	public String profile(HttpServletRequest req) {


		req.setAttribute("categories",  (ArrayList<Category>) categoryRepository.findAll());
		req.setAttribute("products",    (ArrayList<Product>) productRepository.findAll());
		return "profile";
	}
}
