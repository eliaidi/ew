package com.sthy.service;

import java.util.List;
import java.util.Map;

import com.sthy.pojo.DataGridResult;
import com.sthy.pojo.Employee;
import com.sthy.pojo.Menu;
import com.sthy.pojo.Role;
import com.sthy.pojo.Services;
import com.sthy.pojo.User;

/**
 * 后台管理Service接口
 * 
 * @author Administrator
 * 
 */
public interface IManageService {

	/**
	 * 登录校验
	 * 
	 * @param user
	 * @return
	 */
	public boolean login(Map<String, Object> param);

	/**
	 * 获取用户信息
	 * 
	 * @param user
	 * @return
	 */
	public User queryUser(Map<String, Object> param);

	/**
	 * 查询菜单分页
	 * 
	 * @param param
	 * @return
	 */
	public DataGridResult queryMenuPageList(Map<String, Object> param);

	/**
	 * 新增菜单
	 * 
	 * @param menu
	 */
	void insertMenu(Menu menu);

	/**
	 * 更新菜单
	 * 
	 * @param menu
	 */
	void updateMenu(Menu menu);

	/**
	 * 删除菜单
	 * 
	 * @param menu
	 */
	void deleteMenu(Menu menu);

	/**
	 * 查询角色分页
	 * 
	 * @param param
	 * @return
	 */
	DataGridResult queryRolePageList(Map<String, Object> param);

	/**
	 * 新增角色
	 * 
	 * @param role
	 */
	void insertRole(Role role);

	/**
	 * 更新角色
	 * 
	 * @param role
	 */
	void updateRole(Role role);

	/**
	 * 删除角色
	 * 
	 * @param role
	 */
	void deleteRole(Role role);

	/**
	 * 查询菜单List
	 * 
	 * @param param
	 * @return
	 */
	List<Menu> queryMenuList(Map<String, Object> param);

	/**
	 * 查询用户分页
	 * 
	 * @param param
	 * @return
	 */
	DataGridResult queryUserPageList(Map<String, Object> param);

	/**
	 * 新增用户
	 * 
	 * @param user
	 */
	void insertUser(User user);

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 删除用户
	 * 
	 * @param user
	 */
	void deleteUser(User user);

	/**
	 * 查询角色List
	 * 
	 * @param param
	 * @return
	 */
	List<Role> queryRoleList(Map<String, Object> param);

	/**
	 * 查询服务分页
	 * 
	 * @param param
	 * @return
	 */
	DataGridResult queryServicePageList(Map<String, Object> param);

	/**
	 * 新增服务
	 * 
	 * @param services
	 */
	void insertService(Services services);

	/**
	 * 修改服务
	 * 
	 * @param services
	 */
	void updateService(Services services);

	/**
	 * 删除服务
	 * 
	 * @param services
	 */
	void deleteService(Services services);

	/**
	 * 查询员工信息分页
	 * 
	 * @param param
	 * @return
	 */
	DataGridResult queryEmployeePageList(Map<String, Object> param);

	/**
	 * 新增员工
	 * 
	 * @param employee
	 */
	void insertEmployee(Employee employee);

	/**
	 * 修改员工
	 * 
	 * @param employee
	 */
	void updateEmployee(Employee employee);

	/**
	 * 删除员工
	 * 
	 * @param employee
	 */
	void deleteEmployee(Employee employee);

	/**
	 * 查询客户消息分页
	 * 
	 * @param param
	 * @return
	 */
	DataGridResult queryMessagePageList(Map<String, Object> param);
}
