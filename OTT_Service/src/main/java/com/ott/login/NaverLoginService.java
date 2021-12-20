package com.ott.login;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class NaverLoginService implements LoginInterface {

	@Override
	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	@Override
	public HashMap<String, String> makeRequestStatment(String clientId) {
		String redirectUri = "http://localhost:9090/naver_callback";
		String state = generateState();
		String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+clientId+"&redirect_uri="
						+redirectUri+"&state="+state;
		
		HashMap<String, String> naverUrl = new HashMap<String, String>();
		naverUrl.put("state", state);
		naverUrl.put("url", url);
		return naverUrl;
	}

	@Override
	public HashMap<String, String> getRequestKey(String state, String code, String clientId,
			String clientSecret) {
		String naverUrl = "https://nid.naver.com/oauth2.0/token?client_id="+clientId+"&client_secret="+clientSecret
							+"&grant_type=authorization_code&state="+state+"&code="+code;
		String naverJsonKey = "";
		HashMap<String, String> result = new HashMap<String, String>();
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(naverUrl).openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String input = null;
			while((input = reader.readLine()) != null) {
				naverJsonKey = naverJsonKey+input;
			}
		} catch (Exception e) {
			
		}
		
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(naverJsonKey);
			result.put("access_token", (String) jsonObject.get("access_token"));
			result.put("refresh_token", (String) jsonObject.get("refresh_token"));
			result.put("token_type", (String) jsonObject.get("token_type"));
			result.put("expires_in", (String) jsonObject.get("expires_in"));
			
		} catch (Exception e) {
			
		}
		return result;
	}

	@Override
	public HashMap<String, String> requestUserInfo(String token_type, String access_token) {
		String url = "https://openapi.naver.com/v1/nid/me";
		String naverResult = "";
		
		HashMap<String, String> result = new HashMap<String, String>();
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", token_type+" "+access_token);
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String input = null;
			while((input = reader.readLine()) != null) {
				naverResult = naverResult+input;
			}
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(naverResult);
			JSONObject response = (JSONObject) jsonObject.get("response");
			String id = (String) response.get("id");
			String nickname = (String) response.get("nickname");
			String name = (String) response.get("name");
			String email = (String) response.get("email");
			String gen = (String) response.get("gender");
			String gender = null;
			
			if("M".equals(gen)) {
				gender = "1";
			}else if("W".equals(gen)) {
				gender = "2";
			}else {
				gender = "0";
			}
			
			result.put("id", id);
			result.put("nickname", nickname);
			result.put("name", name);
			result.put("email", email);
			result.put("gender", gender);
			
		} catch (Exception e) {
			
		}
		return result;
	}

}
