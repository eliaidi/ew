package com.sthy.dao;

import java.util.List;
import java.util.Map;

import com.sthy.pojo.Category;
import com.sthy.pojo.Product;
import com.sthy.pojo.ProductImg;

public interface IProductDao {

	List<Product> queryProductList(Map<String, Object> param);

	List<ProductImg> queryProductImgList(Map<String, Object> param);

	/**
	 * 查询产品分类列表
	 * 
	 * @return
	 */
	List<Category> queryCategoryList();
}
