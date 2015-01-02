package com.sthy.util;

/**
 * 常量定义类
 * 
 * @author Administrator
 * 
 */
public interface CONST {

	/**
	 * 基本常量
	 * 
	 * @author Administrator
	 * 
	 */
	interface BASE {

		String ROOT_PATH = System.getProperty("catalina.base") + "/webapps/ew/";
		
		String ABOUTUS_PATH	 = "images/aboutus/";

		/**
		 * 用户登录信息存放Key
		 */
		String USER = "user";

		/**
		 * 公共信息存在SESSION中的key
		 */
		String PARAM = "param";

		/**
		 * 重定向
		 */
		String REDIRECT = "redirect:";
	}

	/**
	 * 
	 * @author Administrator
	 * 
	 */
	interface NAVBAR {
		String HOME = "home";

		String ABOUTUS = "aboutUs";

		String SERVICES = "services";

		String PRODUCT = "product";

		String CONTACT = "contact";
	}

	/**
	 * AJAX操作状态量
	 * 
	 * @author Administrator
	 * 
	 */
	interface AJAX {
		/**
		 * 成功
		 */
		boolean SUCCESS = true;

		/**
		 * 失败
		 */
		boolean FAIL = false;
	}

	interface FLAG {
		String YES = "0";

		String NO = "1";
	}
}
