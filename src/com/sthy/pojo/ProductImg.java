package com.sthy.pojo;

import com.sthy.base.BasePojo;

public class ProductImg extends BasePojo {

	private String product_id;
	
	private String img_path;

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
}
