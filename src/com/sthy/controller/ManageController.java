package com.sthy.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sthy.base.BaseController;
import com.sthy.pojo.DataGridResult;
import com.sthy.pojo.Employee;
import com.sthy.pojo.Menu;
import com.sthy.pojo.Result;
import com.sthy.pojo.Role;
import com.sthy.pojo.Services;
import com.sthy.pojo.Tree;
import com.sthy.pojo.User;
import com.sthy.service.IManageService;
import com.sthy.service.impl.ManageServiceImpl;
import com.sthy.util.CONST;
import com.sthy.util.ListUtils;
import com.sthy.util.MD5Utils;
import com.sthy.util.PropertiesUtils;
import com.sthy.util.UuidUtils;

/**
 * 后台管理Controller
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping(value = "/manage")
public class ManageController extends BaseController {

	/**
	 * 后台管理Service
	 */
	@Autowired
	private IManageService manageService;

	/**
	 * 登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login")
	@ResponseBody
	public Result login(HttpSession session, User user) {
		Result result = new Result(false);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("username", user.getUsername());
		param.put("password", user.getPassword());
		if (manageService.login(param)) {
			session.setAttribute(CONST.BASE.USER,
					manageService.queryUser(param));
			result.setCode(true);
		}
		return result;
	}

	/**
	 * 跳转管理主界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goManage")
	public ModelAndView goManage() {
		return new ModelAndView("manage/Manage");
	}

	/**
	 * 注销
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/goLogout")
	public ModelAndView goLogout(HttpSession session) {
		session.removeAttribute(CONST.BASE.USER);
		return new ModelAndView("manage/Login");
	}

	/**
	 * 跳转国际化管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goI18N")
	public ModelAndView goI18N() {
		ModelAndView view = new ModelAndView("manage/I18N");
		return view;
	}

	/**
	 * 查询国际化分页
	 * 
	 * @param locale
	 * @return
	 */
	@RequestMapping(value = "/queryI18nData")
	@ResponseBody
	public DataGridResult queryI18nData(String locale) {
		DataGridResult result = new DataGridResult();
		try {
			List<Map<String, Object>> list = PropertiesUtils
					.getProperties(locale);
			result.setRows(list);
			result.setTotal(list.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 修改国际化
	 * 
	 * @param key
	 * @param value
	 * @param fileName
	 * @return
	 */
	@RequestMapping(value = "/updateI18n")
	@ResponseBody
	public Result updateI18n(String key, String value, String fileName) {
		try {
			PropertiesUtils.updateProperties(fileName, key, value);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new Result(true);
	}

	/**
	 * 跳转菜单管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goMenu")
	public ModelAndView goMenu() {
		ModelAndView view = new ModelAndView("manage/Menu");
		return view;
	}

	/**
	 * 查询菜单分页
	 * 
	 * @param name
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/queryMenuData")
	@ResponseBody
	public DataGridResult queryMenuData(String name, int page, int rows) {
		DataGridResult result = null;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		this.page(param, page, rows);
		result = manageService.queryMenuPageList(param);
		return result;
	}

	/**
	 * 新增菜单
	 * 
	 * @param menu
	 * @return
	 */
	@RequestMapping(value = "/insertMenu")
	@ResponseBody
	public Result insertMenu(Menu menu) {
		Result result = new Result();
		manageService.insertMenu(menu);
		return result;
	}

	/**
	 * 修改菜单
	 * 
	 * @param menu
	 * @return
	 */
	@RequestMapping(value = "/updateMenu")
	@ResponseBody
	public Result updateMenu(Menu menu) {
		Result result = new Result();
		manageService.updateMenu(menu);
		return result;
	}

	/**
	 * 删除菜单
	 * 
	 * @param menu
	 * @return
	 */
	@RequestMapping(value = "/delMenu")
	@ResponseBody
	public Result delMenu(Menu menu) {
		Result result = new Result();
		manageService.deleteMenu(menu);
		return result;
	}

	/**
	 * 跳转角色
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goRole")
	public ModelAndView goRole() {
		return new ModelAndView("manage/Role");
	}

	/**
	 * 查询角色分页
	 * 
	 * @param name
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/queryRoleData")
	@ResponseBody
	public DataGridResult queryRoleData(String name, int page, int rows) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		this.page(param, page, rows);
		DataGridResult result = manageService.queryRolePageList(param);
		return result;
	}

	/**
	 * 查询角色拥有的菜单树
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping("/queryMenuByRole")
	@ResponseBody
	public List<Tree> queryMenuByRole(Role role) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Menu> menus = manageService.queryMenuList(param);
		param.put("role_id", role.getId());
		List<Menu> roleMenus = manageService.queryMenuList(param);
		List<Tree> trees = new ArrayList<Tree>();
		if (ListUtils.isNotEmpty(menus)) {
			for (Menu menu : menus) {
				Tree tree = new Tree();
				tree.setId(menu.getId());
				tree.setText(menu.getName());
				if (ListUtils.isNotEmpty(roleMenus)) {
					for (Menu roleMenu : roleMenus) {
						if (roleMenu.getId().equals(menu.getId())) {
							tree.setChecked(true);
							break;
						}
					}
				}
				trees.add(tree);
			}
		}
		return trees;
	}

	/**
	 * 新增角色
	 * 
	 * @param role
	 * @param menuIds
	 * @return
	 */
	@RequestMapping(value = "/insertRole")
	@ResponseBody
	public Result insertRole(Role role, String menuIds) {
		Result result = new Result();
		if (StringUtils.isNotEmpty(menuIds)) {
			String[] arrays = menuIds.split(",");
			List<Menu> list = new ArrayList<Menu>();
			for (String id : arrays) {
				Menu menu = new Menu();
				menu.setId(id);
				list.add(menu);
			}
			role.setMenus(list);
		}
		manageService.insertRole(role);
		return result;
	}

	/**
	 * 更新角色
	 * 
	 * @param role
	 * @param menuIds
	 * @return
	 */
	@RequestMapping(value = "/updateRole")
	@ResponseBody
	public Result updateRole(Role role, String menuIds) {
		Result result = new Result();
		if (StringUtils.isNotEmpty(menuIds)) {
			String[] arrays = menuIds.split(",");
			List<Menu> list = new ArrayList<Menu>();
			for (String id : arrays) {
				Menu menu = new Menu();
				menu.setId(id);
				list.add(menu);
			}
			role.setMenus(list);
		}
		manageService.updateRole(role);
		return result;
	}

	/**
	 * 删除角色
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "/delRole")
	@ResponseBody
	public Result delRole(Role role) {
		Result result = new Result();
		manageService.deleteRole(role);
		return result;
	}

	/**
	 * 跳转用户界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goUser")
	public ModelAndView goUser() {
		return new ModelAndView("manage/User");
	}

	/**
	 * 请求用户分页列表
	 * 
	 * @param name
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/queryUserData")
	@ResponseBody
	public DataGridResult queryUserData(String name, int page, int rows) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		this.page(param, page, rows);
		DataGridResult result = manageService.queryUserPageList(param);
		return result;
	}

	/**
	 * 请求角色列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryRoleList")
	@ResponseBody
	public List<Role> queryRoleList() {
		return manageService.queryRoleList(null);
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/insertUser")
	@ResponseBody
	public Result insertUser(User user) {
		Result result = new Result();
		user.setPassword(MD5Utils.encryption(user.getPassword()));
		manageService.insertUser(user);
		return result;
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/updateUser")
	@ResponseBody
	public Result updateUser(User user) {
		Result result = new Result();
		manageService.updateUser(user);
		return result;
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/delUser")
	@ResponseBody
	public Result delUser(User user) {
		Result result = new Result();
		manageService.deleteUser(user);
		return result;
	}

	/**
	 * 跳转服务管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goServices")
	public ModelAndView goServices() {
		return new ModelAndView("manage/Services");
	}

	/**
	 * 请求服务分页
	 * 
	 * @param name
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/queryServicesData")
	@ResponseBody
	public DataGridResult queryServicesData(String title, int page, int rows) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("title", title);
		this.page(param, page, rows);
		DataGridResult result = manageService.queryServicePageList(param);
		return result;
	}

	/**
	 * 
	 * @param services
	 * @return
	 */
	@RequestMapping(value = "/insertServices")
	@ResponseBody
	public Result insertServices(Services services) {
		Result result = new Result();
		services.setId(UuidUtils.getUUID());
		manageService.insertService(services);
		return result;
	}

	/**
	 * 
	 * @param services
	 * @return
	 */
	@RequestMapping(value = "/updateServices")
	@ResponseBody
	public Result updateServices(Services services) {
		Result result = new Result();
		manageService.updateService(services);
		return result;
	}

	/**
	 * 
	 * @param services
	 * @return
	 */
	@RequestMapping(value = "/delServices")
	@ResponseBody
	public Result delServices(Services services) {
		Result result = new Result();
		manageService.deleteService(services);
		return result;
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goEmployee")
	public ModelAndView goEmployee() {
		return new ModelAndView("manage/Employee");
	}

	/**
	 * 
	 * @param name
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/queryEmployeeData")
	@ResponseBody
	public DataGridResult queryEmployeeData(String name, int page, int rows) {
		Map<String, Object> param = new HashMap<String, Object>();
		this.page(param, page, rows);
		param.put("name", name);
		DataGridResult result = manageService.queryEmployeePageList(param);
		return result;
	}

	/**
	 * 
	 * @param files
	 * @param employee
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/insertEmployee")
	@ResponseBody
	public Result insertEmployee(@RequestParam MultipartFile[] files,
			Employee employee, HttpServletRequest request) {
		Result result = new Result(false);
		try {
			String savePath = request.getSession().getServletContext()
					.getRealPath("/")
					+ CONST.BASE.ABOUTUS_PATH;
			String uuid = UuidUtils.getUUID();
			employee.setId(uuid);
			if (files != null && files.length > 0) {
				for (int i = 0; i < files.length; i++) {
					MultipartFile file = files[i];
					String type = file.getOriginalFilename().split("\\.")[1];
					String fileName = null;
					if (i == 0) {
						fileName = uuid + "a." + type;
						employee.setStart_img_path(CONST.BASE.ABOUTUS_PATH
								+ fileName);
					} else {
						fileName = uuid + "b." + type;
						employee.setEnd_img_path(CONST.BASE.ABOUTUS_PATH
								+ fileName);
					}
					File targetFile = new File(savePath + fileName);
					if (!targetFile.exists()) {
						targetFile.mkdirs();
					}
					file.transferTo(targetFile);
				}
			}
			manageService.insertEmployee(employee);
			result.setCode(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * @param employee
	 * @param files
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updateEmployee")
	@ResponseBody
	public Result updateEmployee(Employee employee,
			@RequestParam MultipartFile[] files, HttpServletRequest request) {
		Result result = new Result(false);
		String savePath = request.getSession().getServletContext()
				.getRealPath("/")
				+ CONST.BASE.ABOUTUS_PATH;
		try {
			if (files != null && files.length > 0) {
				for (int i = 0; i < files.length; i++) {
					MultipartFile file = files[i];
					if (file != null
							&& StringUtils.isNotEmpty(file
									.getOriginalFilename())) {
						String type = file.getOriginalFilename().split("\\.")[1];
						String fileName = null;
						if (i == 0) {
							fileName = employee.getId() + "a." + type;
							employee.setStart_img_path(CONST.BASE.ABOUTUS_PATH
									+ fileName);
						} else {
							fileName = employee.getId() + "b." + type;
							employee.setEnd_img_path(CONST.BASE.ABOUTUS_PATH
									+ fileName);
						}
						File targetFile = new File(savePath + fileName);
						if (!targetFile.exists()) {
							targetFile.mkdirs();
						}
						file.transferTo(targetFile);
					}
				}
			}
			manageService.updateEmployee(employee);
			result.setCode(true);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/deleteEmployee")
	@ResponseBody
	public Result deleteEmployee(Employee employee) {
		Result result = new Result(false);
		manageService.deleteEmployee(employee);
		result.setCode(true);
		return result;
	}

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/goMessage")
	public ModelAndView goMessage() {
		return new ModelAndView("manage/Message");
	}

	/**
	 * 
	 * @param name
	 * @param isFlag
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value = "/queryMessageData")
	@ResponseBody
	public DataGridResult queryMessageData(String name, String isFlag,
			int page, int rows) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("isFlag", isFlag);
		this.page(param, page, rows);
		DataGridResult result = manageService.queryMessagePageList(param);
		return result;
	}
}
