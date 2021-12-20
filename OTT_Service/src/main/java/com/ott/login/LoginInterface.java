package com.ott.login;

import java.util.HashMap;

public interface LoginInterface {
	String generateState();
	
	HashMap<String, String> makeRequestStatment(String paramString);
	
	HashMap<String, String> getRequestKey(String paramString1, String paramString2, String paramString3, String paramString4);
	
	HashMap<String, String> requestUserInfo(String paramString1, String paramString2);
}
