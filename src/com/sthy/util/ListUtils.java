package com.sthy.util;

import java.util.List;

/**
 * List集合操作类
 * 
 * @author Administrator
 * 
 */
public class ListUtils {

	/**
	 * 如果为空返回true,如果不为空返回false
	 * 
	 * @param list
	 * @return
	 */
	public static boolean isEmpty(List list) {
		if (list != null && list.size() > 0) {
			return false;
		}
		return true;
	}

	public static boolean isNotEmpty(List list) {
		if (list != null && list.size() > 0) {
			return true;
		}
		return false;
	}
}
