package com.ott.app.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ott.Util.Security;
import com.ott.dao.LoginDAO;
import com.ott.dao.ManagerDAO;
import com.ott.user.vo.ManagerVO;
import com.ott.user.vo.UserVO;

@Controller
public class AdminController {
	@Autowired
	private ManagerDAO mdao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/manager_login")
	public String Login() {
		
		return "admin/admin_login";
	}
	
	@RequestMapping("/manager_logout")
	public String logout() {
		System.out.println("LogOut=================");
		HttpSession session = request.getSession();
		session.removeAttribute("ManVO");
		
		return "redirect:/";
	}
	
	@RequestMapping("/manager_join")
	public String join_detail_view() {	
		return "admin/admin_join";
	}
	
	@RequestMapping("/adminPage")
	public String index() {	
		return "admin/admin"; 
	}

	
	@RequestMapping( value = "/admin", method = RequestMethod.POST)
	public ModelAndView login(String manager_id , String manager_pw) {

		ModelAndView mv = new ModelAndView();
		
		String big = Security.generateSalt();
		String fat = Security.getbig(manager_pw, big);
		
		System.out.println("M_ID ---------------------------------------->>>>>> "+manager_id);

		ManagerVO m_vo = mdao.login(manager_id, fat);
		
		if(m_vo != null) {
			System.out.println("로그인성공");
			session.setAttribute("ManVO", m_vo);
			mv.addObject("mvo",m_vo);
			mv.setViewName("admin/admin");
			System.out.println(session.getAttribute("ManVO"));
		}
		else if(m_vo == null)
		    mv.setViewName("redirect:/manager_login");
		
		return mv;
	}
	

	
	  @RequestMapping(value = "/manager_join", method = RequestMethod.POST) 
	  public ModelAndView join(ManagerVO mvo) throws Exception { 
		  ModelAndView mv = new ModelAndView();
	  
	  String m_pw = mvo.getManager_pw(); 
	  String big = Security.generateSalt(); 
	  String fat = Security.getbig(m_pw, big);
	  
	  mvo.setOm_salt(big); 
	  mvo.setManager_pw(fat); 
	  mvo.setOm_status("1");
	  mdao.manager_join(mvo); 
	  
	  Map<String, String> map = new HashMap<String, String>();
	  
	  map.put("manager_id", mvo.getOm_idx()); 
	  mv.setViewName("redirect:/manager_login");

	  return mv; 
	  }
	 
	
	@RequestMapping("/m_idCheck")
	@ResponseBody
	public int m_idCheck(String manager_id) {
		int cnt = 0;
		ManagerVO mvo = mdao.manager_info(manager_id);
		if(mvo != null) {
			cnt = 1;
		}
		
		return cnt;
	}
}
