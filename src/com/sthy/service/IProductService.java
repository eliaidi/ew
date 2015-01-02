package com.sthy.service;

import java.util.List;
import java.util.Map;

import com.sthy.pojo.Category;
import com.sthy.pojo.Product;

/**
 * 产品Service
 * 
 * @author Administrator
 * 
 */
public interface IProductService {

	/**
	 * 查询产品分类列表
	 * 
	 * @return
	 */
	List<Category> queryCategoryList();

	/**
	 * 查询产品列表
	 * 
	 * @param param
	 * @return
	 */
	List<Product> queryProductList(Map<String, Object> param);

	/**
	 * 查询产品详细
	 * 
	 * @param param
	 * @return
	 */
	Product queryProductById(Map<String, Object> param);

}
