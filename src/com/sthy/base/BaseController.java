package com.sthy.base;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sthy.pojo.Param;
import com.sthy.util.CONST;

public class BaseController {
	
	/**
	 * 获取重定向字符串
	 * @param url
	 * @return
	 */
	protected String redirect(String url) {
		return CONST.BASE.REDIRECT + url;
	}

	/**
	 * 设置当前导航栏
	 * 
	 * @param session
	 * @param navBar
	 */
	protected void clickNavbar(HttpSession session, String navBar) {
		Param param = this.getParam(session);
		param.setNavBar(navBar);
		session.setAttribute(CONST.BASE.PARAM, param);
	}

	/**
	 * 获取公共变量
	 * 
	 * @param session
	 * @return
	 */
	protected Param getParam(HttpSession session) {
		Param param = null;
		Object object = session.getAttribute(CONST.BASE.PARAM);
		if (object == null) {
			param = new Param();
		} else {
			param = (Param) object;
		}
		return param;

	}
	
    /**
     * 获取远程访问IP
     * @return
     */
    protected String getRemoteIp(HttpServletRequest request){
    	String remoteIp = null;
        if (remoteIp==null || remoteIp.length()==0)
        {
            remoteIp = request.getHeader("x-forwarded-for");
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getHeader("X-Real-IP");
            }
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getHeader("Proxy-Client-IP");
            }
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getHeader("WL-Proxy-Client-IP");
            }
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getHeader("HTTP_CLIENT_IP");
            }
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getRemoteAddr();
            }
            if (remoteIp == null || remoteIp.isEmpty() || "unknown".equalsIgnoreCase(remoteIp)) {
                remoteIp= request.getRemoteHost();
            }
        }
        return remoteIp;
    }
    
    protected void page(Map<String, Object> map,int page,int rows) {
    	if (page <= 0)
        {
            page = 1;
        }
        map.put("startPage", (page - 1) * rows);
        map.put("endPage", rows);
	}
}
