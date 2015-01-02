package com.sthy.pojo;

import com.sthy.base.BasePojo;

/**
 * 站内信息
 * 
 * @author Administrator
 * 
 */
public class Message extends BasePojo {

	private String email;

	private String subject;

	private String message;
	
	private String ip;
	
	private String is_flag;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getIs_flag() {
		return is_flag;
	}

	public void setIs_flag(String is_flag) {
		this.is_flag = is_flag;
	}
}
