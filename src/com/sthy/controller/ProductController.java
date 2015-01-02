package com.sthy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sthy.base.BaseController;
import com.sthy.pojo.Category;
import com.sthy.pojo.Product;
import com.sthy.service.IProductService;
import com.sthy.util.CONST;

@Controller
@RequestMapping(value = "/product")
public class ProductController extends BaseController {

	@Autowired
	private IProductService productService;

	/**
	 * 跳转产品展示
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goProduct")
	public ModelAndView goPortfolio(HttpSession session) {
		super.clickNavbar(session, CONST.NAVBAR.PRODUCT);
		ModelAndView view = new ModelAndView("Product");
		List<Category> categorys = productService.queryCategoryList();
		Map<String, Object> param = new HashMap<String, Object>();
		List<Product> products = productService.queryProductList(param);
		view.addObject("categorys", categorys);
		view.addObject("products", products);
		return view;
	}
	
	/**
	 * 跳转产品详细展示
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goProductDetail")
	public ModelAndView goProductDetail(HttpSession session,Product product) {
		super.clickNavbar(session, CONST.NAVBAR.PRODUCT);
		ModelAndView view = new ModelAndView("ProductDetail");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", product.getId());
		Product pojo = productService.queryProductById(param);
		
		view.addObject("product", pojo);
		return view;
	}
}
