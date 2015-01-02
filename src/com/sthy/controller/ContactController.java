package com.sthy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sthy.base.BaseController;
import com.sthy.pojo.Contact;
import com.sthy.pojo.Message;
import com.sthy.pojo.Result;
import com.sthy.service.IContactService;
import com.sthy.util.CONST;
import com.sthy.util.DateUtils;
import com.sthy.util.UuidUtils;

@Controller
@RequestMapping(value = "/contact")
public class ContactController extends BaseController {

	@Autowired
	private IContactService contactService;

	/**
	 * 跳转联系我们
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/goContact")
	public ModelAndView goContact(HttpSession session) {
		super.clickNavbar(session, CONST.NAVBAR.CONTACT);
		ModelAndView view = new ModelAndView("Contact");
		Map<String, Object> param = new HashMap<String, Object>();
		return view;
	}

	/**
	 * 提交需求信息
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/insertMessage")
	@ResponseBody
	public Result insertMessage(HttpServletRequest request,HttpSession session,Message message) {
		Result result = new Result();
		try {
			message.setId(UuidUtils.getUUID());
			message.setCreate_time(DateUtils.getNowTime());
			message.setIp(this.getRemoteIp(request));
			contactService.insertMessage(message);
			result.setCode(CONST.AJAX.SUCCESS);
			result.setMessage("需求提交成功!");
		} catch (Exception e) {
			result.setCode(CONST.AJAX.FAIL);
			result.setMessage("服务调用出错!");
		}
		return result;
	}
}
