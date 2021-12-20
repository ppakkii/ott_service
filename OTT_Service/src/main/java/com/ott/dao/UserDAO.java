package com.ott.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.ott.Util.editImg1;
import com.ott.user.vo.UserVO;
@Component
public class UserDAO {
	
	private editImg1 ei;
	
	private String img_path = "/resources/user_img/";
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private SqlSessionTemplate ss;
	
	// ======== 회원관리 게시판 ========
	public UserVO[] getList(int begin, int end) {
		UserVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));

		List<UserVO> list = ss.selectList("user.user_list", map);
		if (list != null && list.size() > 0) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}

	// ======== 페이징을 위한 전체 회원수 ========
	public int getTotalCount() {
		return ss.selectOne("user.totalCount");
	}

	// ======== 회원 검색 기능 ===========
	public UserVO[] searchUser(int begin, int end, String searchType, String searchValue) {
		UserVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("searchType"  , searchType);
		map.put("searchValue" , searchValue);

		List<UserVO> list = ss.selectList("user.user_search", map);
		if (list != null && list.size() > 0) {
			ar = new UserVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}

	// ======== 페이징을 위한 검색된 회원수==========
	public int getSearchCount(String searchType, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		int test =0;
		try {
			test = ss.selectOne("user.search_total", map);	
		} catch (Exception e) {
			test = 0;
		}
		
		return test;
	}

	
	
	// ======== 회원 정지상태 수정 ========
	public String updateUser_stop(Map<String, String> map) {
		String result = "FAIL";
		try {
			ss.update("user.user_editStop", map);
			result = "SUCC";
		} catch (Exception e) {
			result = "FAIL :: DB오류 ";
			// TODO: handle exception
		}
		return result;
	}


	//이미지 파일 원본이름 사본이름 저장 DB저장
//	public int editImg(UserVO vo) {
//		vo = (UserVO)session.getAttribute("uvo");
//		//ei = new editImg1(vo);
//		
//		ei= new editImg1();
//		ei.setVo(vo);
//		
//		return ss.update("user_service.user_img", ei.getVo());
//	}
		
	
	//유저 종합 정보
	public ModelAndView userInfo(UserVO vo) {
		ModelAndView mv = new ModelAndView();
		vo = ss.selectOne("user_service.user_info1", vo.getU_idx());
//		vo = (UserVO)session.getAttribute("uvo");
//		vo.setReviewEA(svo.getReviewEA());
		
		ei = new editImg1(vo);

		mv.addObject("vo", ei.getVo());
		mv.setViewName("/user/user_info");
		
		return mv;
	}

	//비동기 통신 유저 프로필 이미지 업로드
	public Map<String, String> saveImg(UserVO vo) {
		//콜바이 레퍼런스 리퀘스트도 가능!!
		UserVO ss1 = (UserVO)session.getAttribute("uvo");
//		ss1.setS_file(vo.getS_file());
//		ss1.setFilePath(application.getRealPath(img_path));
//		vo=ss.selectOne("user_service.user_info1", ss1);
		vo.setFilePath(application.getRealPath(img_path));
		
		
		ei = new editImg1();
		ei.setVo(vo);
		
//		UserVO vos = ei.getVo();
//		System.out.println("BD 로 보낼 u_idx=====>>"+ ei.getVo().getU_idx());
//		System.out.println("BD 로 보낼 O네임======>>"+ ei.getVo().getOname());
//		System.out.println("BD 로 보낼 F네임======>>"+ ei.getVo().getFname());
//		System.out.println("BD 로 보낼 U_네임=====>>"+ ei.getVo().getU_name());
//		System.out.println("BD 로 보낼 어버웃미====>>"+ ei.getVo().getAbout_me());
//		System.out.println("사진이 없을때 "+ vo1.getIdImg());
		int status = 0;
		if(ei.getVo().getFname() != null && ei.getVo().getFname().trim().length() > 0 ) {
			status=ss.update("user_service.user_img", ei.getVo());
			System.out.println("저장되었으면 1 아니면 0 =======>"+status);
		}
		
		if(vo.getU_name() != null && vo.getU_name().trim().length() > 0) {
			
			//세션에 저장 로그인 검사 할때 영향 안주는 방법
			ss1.setU_name(vo.getU_name());
		}
		int cnt = ss.update("review.editU_name",ss1);
		return ei.getMap();
		
	}
	
	// 회원 비밀번호 확인
	public UserVO user_pw_check(String u_id, String u_idx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_idx", u_idx);
		return ss.selectOne("user_service.user_pw_check",map);
	}
		
	// 회원 비밀번호 바꾸기
	public int change_pwd(Map<String, String> map) {
		return ss.update("user_service.change_pwd",map) ;
	}
	
	public UserVO get_user_level(String u_idx) {
		
		return ss.selectOne("user_service.get_user_level", u_idx);
		
	}
}
