package com.sthy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

/**
 * 时间操作类
 * 
 * @author Administrator
 * 
 */
public class DateUtils {

	private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 获取当前时间
	 * 
	 * @return
	 */
	public static String getNowTime() {
		return format.format(new Date());
	}
}
