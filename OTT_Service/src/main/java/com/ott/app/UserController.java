package com.ott.app;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ott.dao.UserDAO;
import com.ott.user.vo.UserVO;
@Controller
public class UserController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserDAO u_dao;

	
	//비동기 유저 프로필 이미지
	@RequestMapping(value = "/saveImage", method = RequestMethod.POST)
	@ResponseBody
	private Map<String, String> saveImg(UserVO vo){
		UserVO svo = (UserVO)session.getAttribute("uvo");
		if(vo.getS_file() != null)
			svo.setS_file(vo.getS_file());
		
		if(vo.getU_name() != null && vo.getU_name().trim().length() > 0)
			svo.setU_name(vo.getU_name());
		
		if(vo.getAbout_me() != null && vo.getAbout_me().trim().length() > 0)
			svo.setAbout_me(vo.getAbout_me());
		
		if(svo.getS_file() != null)
			System.out.println("들어는 오냐?"+vo.getS_file());
//		System.out.println("유저 별명========================>>"+vo.getU_name());
//		System.out.println("설명글===============>"+vo.getAbout_me());
		return u_dao.saveImg(svo);
	}
	
	//유저 정보
	@RequestMapping(value =  "/user_info", method = RequestMethod.POST)
	public ModelAndView userInfo(UserVO vo) {
//		UserVO svo = (UserVO)session.getAttribute("uvo");
//		vo = svo;
		return u_dao.userInfo(vo);
	}
}

