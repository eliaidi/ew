package com.sthy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sthy.dao.IManageDao;
import com.sthy.pojo.DataGridResult;
import com.sthy.pojo.Employee;
import com.sthy.pojo.Menu;
import com.sthy.pojo.Message;
import com.sthy.pojo.Role;
import com.sthy.pojo.Services;
import com.sthy.pojo.User;
import com.sthy.service.IManageService;
import com.sthy.util.CONST;
import com.sthy.util.FileUtils;
import com.sthy.util.ListUtils;
import com.sthy.util.MD5Utils;

/**
 * 后台管理Service实现类
 * 
 * @author Administrator
 * 
 */
@Service("manageService")
public class ManageServiceImpl implements IManageService {

	@Autowired
	private IManageDao manageDao;

	@Override
	public boolean login(Map<String, Object> param) {
		List<User> list = manageDao.queryUser(param);
		if (ListUtils.isNotEmpty(list)) {
			User user = list.get(0);
			if (user.getPassword().equals(
					MD5Utils.encryption(param.get("password")))) {
				return true;
			}
		}
		return false;
	}

	@Override
	public User queryUser(Map<String, Object> param) {
		List<User> list = manageDao.queryUser(param);
		User user = null;
		if (ListUtils.isNotEmpty(list)) {
			user = list.get(0);
			param.put("id", user.getRole_id());
			List<Role> roles = manageDao.queryRole(param);
			if (ListUtils.isNotEmpty(roles)) {
				Role role = roles.get(0);
				param.put("role_id", role.getId());
				List<Menu> menus = manageDao.queryMenuList(param);
				role.setMenus(menus);
				user.setRole(role);
			}
		}
		return user;
	}

	@Override
	public DataGridResult queryMenuPageList(Map<String, Object> param) {
		List<Menu> rows = manageDao.queryMenuPageList(param);
		int total = manageDao.queryMenuPageTotal(param);
		DataGridResult result = new DataGridResult();
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	@Override
	public void insertMenu(Menu menu) {
		manageDao.insertMenu(menu);
	}

	@Override
	public void updateMenu(Menu menu) {
		manageDao.updateMenu(menu);
	}

	@Override
	public void deleteMenu(Menu menu) {
		manageDao.deleteMenu(menu);
	}

	@Override
	public DataGridResult queryRolePageList(Map<String, Object> param) {
		List<Role> rows = manageDao.queryRolePageList(param);
		int total = manageDao.queryRolePageTotal(param);
		DataGridResult result = new DataGridResult();
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	@Transactional
	@Override
	public void insertRole(Role role) {
		manageDao.insertRole(role);
		List<Menu> menus = role.getMenus();
		if (ListUtils.isNotEmpty(menus)) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("role_id", role.getId());
			for (Menu menu : menus) {
				param.put("menu_id", menu.getId());
				manageDao.insertRoleMenu(param);
			}
		}

	}

	@Transactional
	@Override
	public void updateRole(Role role) {
		manageDao.updateRole(role);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("role_id", role.getId());
		manageDao.deleteRoleMenu(param);
		List<Menu> menus = role.getMenus();
		if (ListUtils.isNotEmpty(menus)) {
			for (Menu menu : menus) {
				param.put("menu_id", menu.getId());
				manageDao.insertRoleMenu(param);
			}
		}

	}

	@Transactional
	@Override
	public void deleteRole(Role role) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("role_id", role.getId());
		manageDao.deleteRoleMenu(param);
		manageDao.deleteRole(role);
	}

	@Override
	public List<Menu> queryMenuList(Map<String, Object> param) {
		return manageDao.queryMenuList(param);
	}

	@Override
	public DataGridResult queryUserPageList(Map<String, Object> param) {
		List<User> rows = manageDao.queryUserPageList(param);
		int total = manageDao.queryUserPageTotal(param);
		DataGridResult result = new DataGridResult();
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	@Override
	public void insertUser(User user) {
		manageDao.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		manageDao.updateUser(user);
	}

	@Override
	public void deleteUser(User user) {
		manageDao.deleteUser(user);
	}

	@Override
	public List<Role> queryRoleList(Map<String, Object> param) {
		return manageDao.queryRoleList(param);
	}

	@Override
	public DataGridResult queryServicePageList(Map<String, Object> param) {
		List<Services> rows = manageDao.queryServicePageList(param);
		int total = manageDao.queryServicePageTotal(param);
		DataGridResult result = new DataGridResult();
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	@Override
	public void insertService(Services services) {
		manageDao.insertService(services);
	}

	@Override
	public void updateService(Services services) {
		manageDao.updateService(services);
	}

	@Override
	public void deleteService(Services services) {
		manageDao.deleteService(services);
	}

	@Override
	public DataGridResult queryEmployeePageList(Map<String, Object> param) {
		List<Employee> rows = manageDao.queryEmployeePageList(param);
		int total = manageDao.queryEmployeePageTotal(param);
		DataGridResult result = new DataGridResult();
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

	@Override
	public void insertEmployee(Employee employee) {
		manageDao.insertEmployee(employee);
	}

	@Override
	public void updateEmployee(Employee employee) {
		manageDao.updateEmployee(employee);
	}

	@Override
	public void deleteEmployee(Employee employee) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", employee.getId());
		List<Employee> list = manageDao.queryEmployee(param);
		if (ListUtils.isNotEmpty(list)) {
			Employee emp = list.get(0);
			FileUtils.remove(CONST.BASE.ROOT_PATH + emp.getStart_img_path());
			FileUtils.remove(CONST.BASE.ROOT_PATH + emp.getEnd_img_path());
			manageDao.deleteEmployee(employee);
		}
	}

	@Override
	public DataGridResult queryMessagePageList(Map<String, Object> param) {
		List<Message> rows = manageDao.queryMessagePageList(param);
		int total = manageDao.queryMessagePageTotal(param);
		DataGridResult result = new DataGridResult();
		result.setRows(rows);
		result.setTotal(total);
		return result;
	}

}
