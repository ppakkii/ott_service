package com.ott.app;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ott.Util.Paging_Review;
import com.ott.dao.UserDAO;
import com.ott.platform.vo.PlatFormVO;
import com.ott.review.dao.ReviewDAO;
import com.ott.review.vo.ReviewVO;
import com.ott.user.vo.UserVO;

@Controller
public class ReviewController {

	@Autowired
	private UserDAO u_dao;
		
	@Autowired
	private ReviewDAO r_dao;

	public final int block_list = 10;
	public final int block_page = 5;
	int nowPage;
	int status;

	@RequestMapping("/showReview")
	public ModelAndView review(@RequestParam(value = "ott_idx") String ott_idx, String cPage) {
		ModelAndView mv = new ModelAndView();

		PlatFormVO vo = r_dao.viewContent(ott_idx);
		int cnt = r_dao.review_count(ott_idx);

		// 페이징
		if (cPage == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(cPage);

		Paging_Review page = new Paging_Review(nowPage, cnt, block_list, block_page, ott_idx);

		int begin = page.getBegin();
		int end = page.getEnd();

		ReviewVO[] rvo = r_dao.getReview(begin, end, ott_idx);

		if (cnt != 0) {
			double rating = r_dao.rating(ott_idx);
			mv.addObject("rating", rating);
		}
	
		
		mv.addObject("vo", vo);
		mv.addObject("rvo", rvo);
		mv.addObject("r_cnt", cnt);
		mv.addObject("nowPage", nowPage);
		mv.addObject("blockList", block_list);
		mv.addObject("pageCode", page.getSb().toString());

		mv.setViewName("review");

		return mv;
	}

	@RequestMapping(value = "/review_add", method = RequestMethod.POST)
	public ModelAndView review_add(UserVO uvo, ReviewVO rvo, String now_page, String u_idx) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		UserVO uvo2 = r_dao.get_u_idx(uvo);
		map.put("u_idx", uvo2.getU_idx());
		map.put("ott_idx", String.valueOf(rvo.getOtt_idx()));

		ReviewVO rvo2 = r_dao.noDouble(map);
		if (rvo2 != null) {
			mv.addObject("page", now_page);
			mv.setViewName("redirect:/nodouble");
		} else {
			rvo.setU_idx(uvo2.getU_idx());

			status = r_dao.add_review(rvo);

			mv.setViewName("redirect:/showReview?ott_idx=" + now_page);
		}
		
		
		if (status > 0) {
			UserVO user_level_vo = u_dao.get_user_level(u_idx);
			
			
			// 레벨 값 비교 및 증가확인을 위한 변수 담기
			int current_level = user_level_vo.getU_level();
			// 경험치 증가
			int current_exp = user_level_vo.getExp() + 5;

			System.out.println("FRIST >>>>> current_level : " + current_level + " current_exp : " + current_exp);

			do {
				// user의 레벨보다 1 증가시킨 경험치와 현재 경험치를 비교함
				// 결과가 0보다 작다면, 레벨업
				int checkLevel = ((current_level + 1) * (current_level + 1) + 2 * (current_level + 1) + 1) * 5
						- current_exp;

				// 경험치가 레벨 증가 시점에 도달 시, 레벨 1 증가
				if (checkLevel <= 0) {
					current_level = current_level + 1;
				} else {
					break;
				}
			} while (true);

			r_dao.get_exp(current_exp, current_level, u_idx);
		}

		return mv;
	}

	@RequestMapping("/nodouble")
	public ModelAndView noDouble(String page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);
		mv.setViewName("/doubleAlert");

		return mv;
	}

	@RequestMapping("/review_del")
	@ResponseBody
	public String review_del(ReviewVO rvo) {
		r_dao.delReview(rvo);
		return "redirect:/showReview?ott_idx=" + rvo.getOtt_idx();
	}

	@RequestMapping("/review_edit")
	@ResponseBody
	public Map<String, Integer> review_edit(ReviewVO rvo) {

		ReviewVO vo = r_dao.selectReview(rvo.getRv_idx());
		int idx = vo.getRv_idx();

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("ott_idx", rvo.getOtt_idx());

		return map;
	}

	@RequestMapping("/edit_review")
	public ModelAndView goEditreview(int rv_idx) {
		ModelAndView mv = new ModelAndView();
		ReviewVO vo = r_dao.selectReview(rv_idx);

		mv.addObject("rvo", vo);
		mv.setViewName("/edit_review");
		return mv;
	}

	@RequestMapping("/review_edit_submit")
	@ResponseBody
	public String review_edit_submit(ReviewVO rvo) {
		r_dao.editReview(rvo);
		return "redirect:/showReview?ott_idx=" + rvo.getOtt_idx();
	}

	@RequestMapping("/review_edit_refresh")
	@ResponseBody
	public String review_edit_refresh() {
		return "redirect:/edit_review";
	}

	@RequestMapping(value = "/thumup", method = RequestMethod.POST)
	@ResponseBody
	public int thumUp(int idx, int ott_idx) {
		Map<String, Integer> s_map = new HashMap<String, Integer>();
		s_map.put("u_idx", idx);
		s_map.put("ott_idx", ott_idx);
		int good = r_dao.isGood(s_map);
		int goodup = good + 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("is_good", goodup);
		map.put("u_idx", idx);
		map.put("ott_idx", ott_idx);

		int res = r_dao.thumpUp(map);
		int up = 0;
		if (res != 0) {
			int cnt = r_dao.isGood(s_map);
			up = cnt;
		}
		return up;
	}

	@RequestMapping(value = "/thumdown", method = RequestMethod.POST)
	@ResponseBody
	public int thumDown(int idx, int ott_idx) {
		Map<String, Integer> s_map = new HashMap<String, Integer>();
		s_map.put("u_idx", idx);
		s_map.put("ott_idx", ott_idx);
		int not = r_dao.isNot(s_map);
		int notup = not + 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("is_not", notup);
		map.put("u_idx", idx);
		map.put("ott_idx", ott_idx);
		int res = r_dao.thumpDown(map);
		int down = 0;
		if (res != 0) {
			int cnt = r_dao.isNot(s_map);
			down = cnt;
		}
		return down;
	}

	@RequestMapping(value = "/addwarning", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Integer> warning(int rv_idx, int ott_idx, int u_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("rv_idx", rv_idx);
		map.put("ott_idx", ott_idx);
		map.put("u_idx", u_idx);

		UserVO uvo = r_dao.getwarning(u_idx);
		String getw = uvo.getIs_warning();
		if (getw == null) {
			getw = "0";
		}
		int addw = Integer.parseInt(getw) + 1;
		uvo.setIs_warning(String.valueOf(addw));
		map.put("is_warning", addw);

		r_dao.warning(map);

		return map;
	}

}
