package com.ott.app;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ott.Util.Security;
import com.ott.dao.FindDAO;
import com.ott.user.vo.UserVO;


@Controller
public class FindController {
	
	@Autowired
	private FindDAO fdao;
	
	@RequestMapping("/idfind")
	public String id_find() {	
		return "user/user_id_find";
	}
	
	// id 찾기 끝
	@RequestMapping(value="/findAction", method=RequestMethod.POST)
	public ModelAndView findAction(String u_email) {
		UserVO vo = fdao.id_find(u_email);
		String id = vo.getU_id();
		String name = vo.getU_name();

		
		System.out.println(id);
		System.out.println(name);

		ModelAndView mv =  new ModelAndView();
		mv.addObject("id", id);
		mv.addObject("name", name);
		mv.setViewName("/user/user_id_find_result");
		
		return mv;
	}
	
	// 비밀번호 찾는 페이지 이동
	@RequestMapping("/pwreissue")
	public String pwreissue() {	
		return "user/user_pw_reissue";
	}
	
	// 비밀번호 찾기 액션
	@RequestMapping(value="/reissueAction")
	public ModelAndView ReissueAction(String u_id, String u_email) {
		ModelAndView mv =  new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		UserVO vo = fdao.checkUser(u_id, u_email);
		String rand_key = randomPwd();
		String big = Security.generateSalt();
		String fat = Security.getbig(rand_key, big);
		
		if(vo != null) {
			map.put("u_pwd1", fat);
			map.put("u_email", u_email);
			String name = vo.getU_name();
			fdao.resetPwd(map);
			mv.addObject("id",u_id);
			mv.addObject("rand_key", rand_key);
			mv.addObject("name", name);
			mv.setViewName("/user/user_pw_result");
		} else {
			mv.setViewName("redirect:pwreissue");
		}
		return mv;
		
	}
	
	// 난수값 만들기
	private String randomPwd() {
		
		Random random = new Random();
		String rand = "";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			Boolean b = random.nextBoolean();
			if(random.nextBoolean()) {
				sb.append((char)(((int)random.nextInt(26))+97));
			} else {
				sb.append(random.nextInt(10));
			}
			sb.append(rand);
		}
		return sb.toString();
	}
}
