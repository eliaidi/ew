package com.sthy.util;

import java.io.File;

/**
 * 文件公共类
 * 
 * @author Administrator
 * 
 */
public class FileUtils {

	/**
	 * 删除文件
	 * 
	 * @param path
	 * @return
	 */
	public static boolean remove(String path) {
		File file = new File(path);
		return file.delete();
	}
}
