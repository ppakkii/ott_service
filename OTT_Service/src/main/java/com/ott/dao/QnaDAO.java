package com.ott.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ott.bbs.vo.QnaCommVO;
import com.ott.bbs.vo.QnaVO;
import com.ott.user.vo.UserVO;



@Component
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	//원하는 페이지의 게시물목록 기능
	public QnaVO[] getList(int begin, int end, String bname) {
		QnaVO[] ar = null;
		
		//맵퍼(bbs.list)를 호출하기 위해 Map구조 생성!
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("bname", bname);
	
		
		List<QnaVO> list = ss.selectList("qna.list", map);
		if(list != null && list.size() > 0) {
			ar = new QnaVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	public QnaCommVO getcommList(String rb_idx){	//	댓글 리스트 불러오기
			return ss.selectOne("qna.commList",rb_idx);
	}

	public int getTotalCount(String bname) {
		return ss.selectOne("qna.totalCount", bname);
	}
	
	//기본키를 인자로 하여 원글 검색
	public QnaVO getBbs(String rb_idx) {
		return ss.selectOne("qna.getBbs", rb_idx);
	}
	
	public int add(QnaVO q_vo) {
		return ss.insert("qna.add", q_vo);
	}
	
	public int edit(QnaVO q_vo) {
		return ss.update("qna.edit", q_vo);
	}
	
	public int delBbs(String rb_idx) {
		return ss.update("qna.del", rb_idx);
	}
	
	public UserVO getUvo(String u_idx) {	//	u_idx로 해당 회원 정보 불러오기
		return ss.selectOne("qna.getUvo", u_idx);
	}
	public UserVO getUvo2(String u_id) {  //  u_id로 해당 회원 정보 불러오기
	  return ss.selectOne("qna.getUvo2",u_id); 
	}
	/*
	public QnaCommVO commentQna(QnaCommVO qc_vo) {	// 댓글 기능
		return ss.selectOne("qna.comment", qc_vo);
	}
	*/
	
	public int commentQna(QnaCommVO qc_vo) {
		
		return ss.insert("qna.comment",qc_vo);
		
	}
	public QnaCommVO editComment(QnaCommVO qc_vo) {	// 댓글 수정
		return ss.selectOne("qna.editComment", qc_vo);
	}

	public QnaCommVO delComment(QnaCommVO qc_vo) {	//	댓글 삭제
		return ss.selectOne("qna.delComment", qc_vo);
	}

	public String updateHit(String rb_idx) {
		// TODO Auto-generated method stub
		return ss.selectOne("qna.updateHit", rb_idx);
	}

	
 
}












