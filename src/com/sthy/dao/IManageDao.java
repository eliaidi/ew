package com.sthy.dao;

import java.util.List;
import java.util.Map;

import com.sthy.pojo.Employee;
import com.sthy.pojo.Menu;
import com.sthy.pojo.Message;
import com.sthy.pojo.Role;
import com.sthy.pojo.Services;
import com.sthy.pojo.User;

public interface IManageDao {

	List<User> queryUser(Map<String, Object> param);
	
	List<Role> queryRole(Map<String, Object> param);
	
	List<Menu> queryMenuList(Map<String, Object> param);
	
	List<Menu> queryMenuPageList(Map<String, Object> param);
	
	int queryMenuPageTotal(Map<String, Object> param);
	
	void insertMenu(Menu menu);
	
	void updateMenu(Menu menu);
	
	void deleteMenu(Menu menu);
	
	List<Role> queryRolePageList(Map<String, Object> param);
	
	int queryRolePageTotal(Map<String, Object> param);

	void insertRole(Role role);
	
	void updateRole(Role role);
	
	void deleteRole(Role role);
	
	void insertRoleMenu(Map<String, Object> param);
	
	void deleteRoleMenu(Map<String, Object> param);
	
	List<User> queryUserPageList(Map<String, Object> param);
	
	int queryUserPageTotal(Map<String, Object> param);
	
	void insertUser(User user);
	
	void updateUser(User user);
	
	void deleteUser(User user);
	
	List<Role> queryRoleList(Map<String, Object> param);
	
	List<Services> queryServicePageList(Map<String, Object> param);
	
	int queryServicePageTotal(Map<String, Object> param);
	
	void insertService(Services services);
	
	void updateService(Services services);
	
	void deleteService(Services services);
	
	List<Employee> queryEmployeePageList(Map<String, Object> param);
	
	int queryEmployeePageTotal(Map<String, Object> param);
	
	List<Employee> queryEmployee(Map<String, Object> param);
	
	void insertEmployee(Employee employee);
	
	void updateEmployee(Employee employee);
	
	void deleteEmployee(Employee employee);
	
	List<Message> queryMessagePageList(Map<String, Object> param);
	
	int queryMessagePageTotal(Map<String, Object> param);
}
