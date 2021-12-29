package com.ott.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.ott.user.vo.ManagerVO;
import com.ott.user.vo.UserVO;

@Component
public class ManagerDAO {

	@Autowired
	HttpSession session;
	
	@Autowired
	private SqlSessionTemplate ss;




	// 메니저 신청
	public int manager_join(ManagerVO mvo) {

		return ss.insert("admin.m_join", mvo);
	}

	/*
	// login
	public ManagerVO login(String manager_id, String fat) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("manager_id", manager_id);
			map.put("manager_pw", fat);
			
			ManagerVO m_vo = ss.selectOne("admin.m_login", map);
		
				return m_vo;	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;			

	}
	
	*/
	public ManagerVO getMvo(String om_idx) {
		return ss.selectOne("admin.manager_info2", om_idx);
	}
	
	public ManagerVO login(String manager_id, String fat) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("manager_id", manager_id);
		map.put("manager_pw", fat);
		
		ManagerVO mvo = ss.selectOne("admin.m_login",map);
		
		return mvo;
	}
	
	//관리자 종합 정보
	public ManagerVO manager_info(String manager_id) {

		return ss.selectOne("admin.manager_info",manager_id);
	}
	


}
