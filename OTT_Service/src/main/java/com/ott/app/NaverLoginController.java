package com.ott.app;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ott.dao.LoginDAO;
import com.ott.login.LoginInterface;
import com.ott.user.vo.UserVO;

@Controller
public class NaverLoginController {
	
	private String state;
	private String code;
	private String access_token;
	private String refresh_token;
	private String token_type;
	
	private String expires_in;
	private final String naverClientId = "OGBjI0KG_grwbi49hcxo";
	private final String naverClientSecret = "eSV3grNp4O";
	private String returnUrl;
	
	@Autowired
	private LoginDAO l_dao;
	
	@Autowired
	private LoginInterface loginService;
	
	@Autowired
	private HttpServletRequest request;
	
	
	
	@RequestMapping("/naver_login")
	public String makeRequestStatement() {
		HashMap<String, String> naverUrl = loginService.makeRequestStatment(naverClientId);
		
		state = naverUrl.get("state");
		returnUrl = request.getHeader("referer");
		
		return "redirect:"+naverUrl.get("url");
	}
	
	@RequestMapping("/naver_callback")
	public String getNaverRequestKey(@RequestParam("state") String state, @RequestParam("code") String code) {
		HttpSession session = request.getSession();
		if(state.equals(this.state)) {
			session.setAttribute("isLoged", Boolean.valueOf(true));
		}else {
			session.setAttribute("isLoged", Boolean.valueOf(false));
			return "redirect:/login";
		}
		this.code = code;
		HashMap<String, String> result = loginService.getRequestKey(state, code, naverClientId, naverClientSecret);
		access_token = result.get("access_token");
		refresh_token = result.get("refresh_token");
		token_type = result.get("token_type");
		expires_in = result.get("expires_in");
		
		return "redirect:/naverRequestUserInfo";
	}
	
	@RequestMapping("/naverRequestUserInfo")
	public String naverRequestUserInfo() {
		HashMap<String, String> result = loginService.requestUserInfo(token_type, access_token);
		String id = result.get("id");
		String email = result.get("email");
		String name = result.get("nickname");
		
		HttpSession session = request.getSession();
		
		UserVO vo = l_dao.user_info(id);
		
		if(vo != null) {
			session.setAttribute("uvo", vo);
		}else {
			UserVO uvo = new UserVO();
			uvo.setU_id(id);
			uvo.setU_pwd1(id);
			uvo.setU_email(email);
			uvo.setU_name(name);
			
			l_dao.naver_user(uvo);
			
			session.setAttribute("uvo", uvo);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		HttpSession session = request.getSession();
		session.removeAttribute("uvo");
		
		return "redirect:/";
	}
}
