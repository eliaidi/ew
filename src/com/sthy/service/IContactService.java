package com.sthy.service;

import java.util.Map;

import com.sthy.pojo.Contact;
import com.sthy.pojo.Message;

public interface IContactService {

	
	Contact queryContactById(Map<String, Object> param);
	
	void insertMessage(Message message);
}
