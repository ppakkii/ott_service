package com.ott.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ott.platform.vo.PlatFormVO;
import com.ott.review.vo.ReviewVO;
import com.ott.user.vo.UserVO;

@Component
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate ss;

	public PlatFormVO viewContent(String i_ott_idx) {
		int ott_idx = Integer.valueOf(i_ott_idx);
		PlatFormVO vo = ss.selectOne("review.viewContent", ott_idx);

		return vo;
	}

	public int add_review(ReviewVO rvo) {

		int cnt = ss.insert("review.add_review", rvo);

		return cnt;

	}

	public int review_count(String i_ott_idx) {

		int ott_idx = Integer.valueOf(i_ott_idx);
		int cnt = ss.selectOne("review.review_count", ott_idx);

		return cnt;

	}

	public UserVO get_u_idx(UserVO uvo) {

		UserVO uvo2 = ss.selectOne("review.get_u_idx", uvo);

		return uvo2;

	}

	public double rating(String i_ott_idx) {
		int ott_idx = Integer.valueOf(i_ott_idx);
		double cnt = ss.selectOne("review.rating", ott_idx);

		return cnt;
	}

	public ReviewVO[] getReview(int begin, int end, String ott_idx) {
		ReviewVO[] ar = null;

		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("ott_idx", ott_idx);

		List<ReviewVO> list = ss.selectList("review.getReview", map);
		if (list != null && list.size() > 0 && !list.isEmpty()) {
			ar = new ReviewVO[list.size()];
			list.toArray(ar);
		}

		return ar;
	}

	public ReviewVO selectReview(int rv_idx) {
		ReviewVO vo = ss.selectOne("review.selectReview", rv_idx);
		return vo;
	}

	public int delReview(ReviewVO rvo) {
		int cnt = ss.update("review.delReview", rvo);
		return cnt;
	}

	public int editReview(ReviewVO rvo) {
		int cnt = ss.update("review.editReview", rvo);

		return cnt;
	}

	public int thumpUp(Map<String, Integer> map) {
		int cnt = ss.update("review.thumpUp", map);
		return cnt;
	}

	public int thumpDown(Map<String, Integer> map) {
		int cnt = ss.update("review.thumpDown", map);
		return cnt;
	}

	public int isGood(Map<String, Integer> map) {
		int cnt = ss.selectOne("review.getGood", map);

		return cnt;
	}

	public int isNot(Map<String, Integer> map) {
		int cnt = ss.selectOne("review.getNot", map);

		return cnt;
	}

	public ReviewVO noDouble(Map<String, String> map) {
		ReviewVO rvo = ss.selectOne("review.nodouble", map);

		return rvo;
	}

	public int warning(Map<String, Integer> map) {
		int cnt = ss.update("review.warning", map);
		return cnt;
	}

	public UserVO getwarning(int u_idx) {
		UserVO vo = ss.selectOne("review.getwarning", u_idx);
		return vo;
	}

	

	// update exp
	public int get_exp(int u_exp, int u_level, String u_idx) {

		System.out.println("Review DAO U_IDX : " + u_idx);

		Map<String, String> map = new HashMap<String, String>();

		map.put("u_exp", String.valueOf(u_exp));
		map.put("u_level", String.valueOf(u_level));
		map.put("u_idx", u_idx);

		return ss.update("review.get_exp", map);
	}
}
