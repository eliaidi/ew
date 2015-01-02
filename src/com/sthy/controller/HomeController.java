package com.sthy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sthy.base.BaseController;
import com.sthy.pojo.Product;
import com.sthy.service.IHomeService;
import com.sthy.service.IProductService;
import com.sthy.util.CONST;

@Controller
@RequestMapping(value = "/home")
public class HomeController extends BaseController {
	
	@Autowired
	private IHomeService homeService;
	
	@Autowired
	private IProductService productService;
	
	/**
	 * 跳转首页
	 * @return
	 */
	@RequestMapping(value = "/goHome")
	public ModelAndView goHome(HttpSession session) {
		super.clickNavbar(session, CONST.NAVBAR.HOME);
		ModelAndView view = new ModelAndView("Home");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("is_flag", CONST.FLAG.YES);
		List<Product> portsfolios = productService.queryProductList(param);
		view.addObject("portsfolios", portsfolios);
		return view;
	}
}
