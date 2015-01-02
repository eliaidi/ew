package com.sthy.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sthy.dao.IContactDao;
import com.sthy.pojo.Contact;
import com.sthy.pojo.Message;
import com.sthy.service.IContactService;
import com.sthy.util.ListUtils;

@Service("contactService")
public class ContactServiceImpl implements IContactService {
	
	@Autowired
	private IContactDao contactDao;

	@Override
	public Contact queryContactById(Map<String, Object> param) {
		List<Contact> list = contactDao.queryContactById(param);
		Contact pojo = null;
		if(ListUtils.isNotEmpty(list)) {
			pojo = list.get(0);
		}
		return pojo;
	}

	@Override
	@Transactional
	public void insertMessage(Message message) {
		contactDao.insertMessage(message);
	}
}
