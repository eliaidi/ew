package com.sthy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sthy.base.BaseController;
import com.sthy.pojo.Employee;
import com.sthy.service.IAboutUsService;
import com.sthy.util.CONST;

@Controller
@RequestMapping(value = "/aboutUs")
public class AboutUsController extends BaseController {

	@Autowired
	private IAboutUsService aboutUsService;
	
	/**
	 * 跳转关于我们
	 * @return
	 */
	@RequestMapping(value = "/goAboutUs")
	public ModelAndView goAboutUs(HttpSession session) {
		super.clickNavbar(session, CONST.NAVBAR.ABOUTUS);
		ModelAndView view = new ModelAndView("AboutUs");
		List<Employee> employees = aboutUsService.queryEmployeeList();
		
		view.addObject("employees", employees);
		return view;
	}
}
