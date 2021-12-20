package com.ott.Util;

import java.security.MessageDigest;
import java.util.Random;

public class Security {
	public static String getbig(String pwd1, String big_fat) {
		String save = "";
		byte[] big = big_fat.getBytes();
		
		byte[] fat = pwd1.getBytes();
		
		byte[] bytes = new byte[big.length+fat.length];
		
		System.arraycopy(fat, 0, bytes, 0, fat.length);
		System.arraycopy(big, 0, bytes, fat.length, 0);
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i=0; i<byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xFF)+256, 16).substring(1));
			}
			save = sb.toString();
		} catch (Exception e) {
		
		}
		return save;
	}
	
	public static String generateSalt() {
		Random random = new Random();
		
		byte[] fat = new byte[8]; //보편적인 값
		random.nextBytes(fat);
		
		StringBuffer sb = new StringBuffer();
		
		for(Byte n : fat) {
			// byte값을 hex 값으로 변환
			String str = String.format("%02x", n);
			sb.append(str);
		}
		return sb.toString();
	}
}
