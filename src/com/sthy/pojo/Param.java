package com.sthy.pojo;

import com.sthy.base.BasePojo;
import com.sthy.util.CONST;

/**
 * 公用变量
 * 
 * @author Administrator
 * 
 */
public class Param extends BasePojo {

	private String navBar = CONST.NAVBAR.HOME;

	public String getNavBar() {
		return navBar;
	}

	public void setNavBar(String navBar) {
		this.navBar = navBar;
	}

}
