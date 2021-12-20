package com.ott.Util;

import java.io.File;

public class FileRenameUtil {
	
	public static String checkSameFileName(String fileName, String path) {
		
		
		int period = fileName.lastIndexOf(".");  //test123.txt -->7
		
		String f_name = fileName.substring(0, period); // test123
		String suffix = fileName.substring( period); // .txt
		
		String saveFileName = path + System.getProperty("file.separator") + fileName;
		
		File f = new File(saveFileName);
		
		int idx = 1;
		while(f != null && f.exists()) {
			
			StringBuffer sb = new StringBuffer();
			sb.append(f_name);
			sb.append("(");
			sb.append(idx++);
			sb.append(")");
			sb.append(suffix);
			
			fileName = sb.toString(); //test123(1).txt
			saveFileName = path + System.getProperty("file.separator") + fileName;//현 OS 에 적합한 기호를 써라 (\, /)
			
			f = new File(saveFileName);
		}
		
		return fileName;
	}
	
}
