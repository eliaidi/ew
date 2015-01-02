package com.sthy.pojo;

import com.sthy.base.BasePojo;

/**
 * 员工信息
 * 
 * @author Administrator
 * 
 */
public class Employee extends BasePojo {

	private String job_description;

	private String description;

	private String start_img_path;

	private String end_img_path;

	public String getJob_description() {
		return job_description;
	}

	public void setJob_description(String job_description) {
		this.job_description = job_description;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStart_img_path() {
		return start_img_path;
	}

	public void setStart_img_path(String start_img_path) {
		this.start_img_path = start_img_path;
	}

	public String getEnd_img_path() {
		return end_img_path;
	}

	public void setEnd_img_path(String end_img_path) {
		this.end_img_path = end_img_path;
	}
}
