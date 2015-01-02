package com.sthy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sthy.dao.IAboutUsDao;
import com.sthy.pojo.Employee;
import com.sthy.service.IAboutUsService;

@Service("aboutUsService")
public class AboutUsServiceImpl implements IAboutUsService {

	@Autowired
	private IAboutUsDao aboutUsDao;
	
	@Override
	public List<Employee> queryEmployeeList() {
		return aboutUsDao.queryEmployeeList();
	}

}
