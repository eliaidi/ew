package com.sthy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sthy.dao.IServicesDao;
import com.sthy.pojo.Services;
import com.sthy.service.IServicesService;

@Service("servicesService")
public class ServicesServiceImpl implements IServicesService {

	@Autowired
	private IServicesDao servicesDao;

	@Override
	public List<Services> queryServicesList() {
		return servicesDao.queryServicesList();
	}
}
