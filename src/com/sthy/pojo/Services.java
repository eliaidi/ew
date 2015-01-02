package com.sthy.pojo;

import com.sthy.base.BasePojo;

public class Services extends BasePojo {

	private String title;
	
	private String sub_title;
	
	private String price;
	
	private String price_model;
	
	private String description;
	
	private String is_flag;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSub_title() {
		return sub_title;
	}

	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPrice_model() {
		return price_model;
	}

	public void setPrice_model(String price_model) {
		this.price_model = price_model;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIs_flag() {
		return is_flag;
	}

	public void setIs_flag(String is_flag) {
		this.is_flag = is_flag;
	}
	
}