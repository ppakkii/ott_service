package com.ott.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ott.Util.Security;
import com.ott.user.vo.UserVO;

import com.ott.dao.UserDAO;

@Controller
public class PwChangeController {
	@Autowired
	private UserDAO u_dao;
	
	@RequestMapping("/pwChange")
	public String pw_change() {	
		return "user/user_pw_change";
	}
	
	@RequestMapping(value="/changeAction", method=RequestMethod.POST)
	public ModelAndView changePwd(UserVO uvo , String new_pwd , String idx, String u_id) {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>();
		
		String big = Security.generateSalt();
		String fat = Security.getbig(new_pwd, big);
		
		// 회원 기존 비밀번호 확인하기.
		uvo = u_dao.user_pw_check(u_id,idx);
		
		if(uvo != null) {
			map.put("u_pwd1", fat);
			map.put("u_idx",idx);
			map.put("u_id",u_id);
			u_dao.change_pwd(map);
			mv.setViewName("redirect:/pwChangeResult");
		}else {
			System.out.println("변경 실패!");
			// 기존 비밀번호를 잘못입력했을때 
			// 쿼리 조건을 만족하지 못한경우
			mv.setViewName("redirect:/pwChange");
		}
		return mv;
	}
	
	@RequestMapping("/pwChangeResult")
	public String pw_change_result() {	
		return "user/user_pw_change_result";
	}
}
