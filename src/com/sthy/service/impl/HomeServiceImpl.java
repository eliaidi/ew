package com.sthy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sthy.dao.IProductDao;
import com.sthy.service.IHomeService;

@Service("homeService")
public class HomeServiceImpl implements IHomeService {

	@Autowired
	private IProductDao productDao;

}
