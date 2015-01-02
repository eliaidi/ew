package com.sthy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sthy.base.BaseController;
import com.sthy.pojo.Employee;
import com.sthy.pojo.Services;
import com.sthy.service.IServicesService;
import com.sthy.util.CONST;

@Controller
@RequestMapping(value = "/services")
public class ServicesController extends BaseController {

	@Autowired
	private IServicesService servicesService;
	
	/**
	 * 跳转服务
	 * @return
	 */
	@RequestMapping(value = "/goServices")
	public ModelAndView goServices(HttpSession session) {
		super.clickNavbar(session, CONST.NAVBAR.SERVICES);
		ModelAndView view = new ModelAndView("Services");
		List<Services> servicess = servicesService.queryServicesList();
		view.addObject("servicess", servicess);
		return view;
	}
}
