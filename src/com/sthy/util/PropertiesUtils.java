package com.sthy.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

public class PropertiesUtils {

	private static final String CONFIG_FILE = "/config/i18n/message_";

	/**
	 * 获取资源文件数据
	 * 
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	public static List<Map<String, Object>> getProperties(String fileName)
			throws IOException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Properties properties = new Properties();
		properties.load(PropertiesUtils.class.getResourceAsStream(CONFIG_FILE
				+ fileName + ".properties"));
		Set<Entry<Object, Object>> set = properties.entrySet();
		Iterator<Entry<Object, Object>> it = set.iterator();
		while (it.hasNext()) {
			Entry<Object, Object> entry = it.next();
			Object key = entry.getKey();
			Object value = entry.getValue();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("key", key);
			map.put("value", value);
			list.add(map);
		}
		return list;
	}

	public static void updateProperties(String fileName, Map<String, String> map)
			throws IOException {
		Properties properties = new Properties();
		properties.load(PropertiesUtils.class.getResourceAsStream(CONFIG_FILE
				+ fileName + ".properties"));
		Set<Entry<String, String>> set = map.entrySet();
		Iterator<Entry<String, String>> it = set.iterator();
		while (it.hasNext()) {
			Entry<String, String> entry = it.next();
			String key = entry.getKey();
			String value = entry.getValue();
			properties.put(key, value);
			String filePath = PropertiesUtils.class.getResource("").toString()
					+ CONFIG_FILE + fileName + ".properties";
			Writer writer = new FileWriter(filePath);
			properties.store(writer, null);
		}
	}

	public static void updateProperties(String fileName, String key,
			String value) throws IOException {
		Properties properties = new Properties();
		properties.load(PropertiesUtils.class.getResourceAsStream(CONFIG_FILE
				+ fileName + ".properties"));
		properties.put(key, value);
		String filePath = PropertiesUtils.class.getResource("/").toString()
				+ "config/i18n/message_" + fileName + ".properties";
		Writer writer = new FileWriter(filePath);
		properties.store(writer, null);
	}
}
