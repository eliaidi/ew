package com.sthy.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.cglib.core.Local;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.sthy.base.BaseController;
import com.sthy.pojo.Result;
import com.sthy.util.CONST;

@Controller
@RequestMapping(value = "/local")
public class LocalChangeController extends BaseController {

	@Autowired
    private LocaleResolver localeResolver;
	
	@RequestMapping(value = "/changeLocal")
	@ResponseBody
	public Result changeLocal(HttpServletRequest request,HttpServletResponse response,HttpSession session,String local) {
		Result result = new Result();
		try {
			Locale locale = new Locale(local);
			if("cn".equals(local)) {
				locale = Locale.CHINA;
			} else if("tw".equals(local))  {
				locale = Locale.TAIWAN;
			} else if("en".equals(local)) {
				locale = Locale.US;
			}
			
			localeResolver.setLocale(request, response, locale);
			session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
			result.setCode(CONST.AJAX.SUCCESS);
		} catch (Exception e) {
			result.setCode(CONST.AJAX.FAIL);
			result.setMessage("语言切换失败");
		}
		return result;
	}
}
