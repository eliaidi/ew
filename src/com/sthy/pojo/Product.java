package com.sthy.pojo;

import java.util.List;

import com.sthy.base.BasePojo;

/**
 * 作品信息
 * 
 * @author Administrator
 * 
 */
public class Product extends BasePojo {

	private String title;
	
	private String sub_title;
	
	private String synopsis;
	
	private String description;
	
	private String description1;
	
	private String img_path;
	
	private String price;
	
	private String price_model;
	
	private String category_id;
	
	private String category_name;
	
	private String order_num;
	
	private String is_flag;
	
	private List<ProductImg> imgs;

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

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
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

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getIs_flag() {
		return is_flag;
	}

	public void setIs_flag(String is_flag) {
		this.is_flag = is_flag;
	}

	public List<ProductImg> getImgs() {
		return imgs;
	}

	public void setImgs(List<ProductImg> imgs) {
		this.imgs = imgs;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription1() {
		return description1;
	}

	public void setDescription1(String description1) {
		this.description1 = description1;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
}
