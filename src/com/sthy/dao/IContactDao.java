package com.sthy.dao;

import java.util.List;
import java.util.Map;

import com.sthy.pojo.Contact;
import com.sthy.pojo.Message;

public interface IContactDao {

	List<Contact> queryContactById(Map<String, Object> param);
	
	void insertMessage(Message message);
}
