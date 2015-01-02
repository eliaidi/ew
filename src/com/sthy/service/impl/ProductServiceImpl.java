package com.sthy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sthy.dao.IProductDao;
import com.sthy.pojo.Category;
import com.sthy.pojo.Product;
import com.sthy.service.IProductService;
import com.sthy.util.ListUtils;

@Service("productService")
public class ProductServiceImpl implements IProductService {

	@Autowired
	private IProductDao productDao;

	@Override
	public List<Category> queryCategoryList() {
		return productDao.queryCategoryList();
	}

	@Override
	public List<Product> queryProductList(Map<String, Object> param) {
		List<Product> list = productDao.queryProductList(param);
		if(ListUtils.isNotEmpty(list)) {
			for(Product pojo : list) {
				param.put("product_id", pojo.getId());
				pojo.setImgs(productDao.queryProductImgList(param));
			}
		}
		return list;
	}

	@Override
	public Product queryProductById(Map<String, Object> param) {
		Product pojo = null;
		List<Product> list = productDao.queryProductList(param);
		if(ListUtils.isNotEmpty(list)) {
			pojo = list.get(0);
			param.put("product_id", pojo.getId());
			pojo.setImgs(productDao.queryProductImgList(param));
		}
		return pojo;
	}
	
	
}
