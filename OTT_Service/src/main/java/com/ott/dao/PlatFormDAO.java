package com.ott.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.ott.platform.vo.PlatFormVO;

@Component
public class PlatFormDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public PlatFormVO[] ott_All(int begin, int end) {
		PlatFormVO[] ar = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<PlatFormVO> nvo = ss.selectList("ott_service.bbs_all", map);
		
		if(nvo != null && nvo.size() > 0) {
			ar = new PlatFormVO[nvo.size()];
			
			nvo.toArray(ar);
		}
		return ar;
	}
	
	public int getTotalCount() {
		int cnt = ss.selectOne("ott_service.bbsTotal");
		
		return cnt;
	}
	
	public int getIdx(String title) {
		PlatFormVO pvo = ss.selectOne("ott_service.searchName", title);
		int cnt = 0;
		if(pvo != null) {
			cnt = Integer.parseInt(pvo.getOtt_idx());
		}
		return cnt;
	}
	
	public int getMinidx(String platform) {
		int cnt = ss.selectOne("ott_service.minIdx", platform);
		return cnt;
	}
	
	public PlatFormVO getRandom(int idx) {
		PlatFormVO vo = ss.selectOne("ott_service.random", idx);
		return vo;
	}
}
