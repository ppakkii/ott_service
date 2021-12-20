package com.ott.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ott.Util.Paging;
import com.ott.dao.PlatFormDAO;
import com.ott.platform.vo.PlatFormVO;

@Controller
public class BbsController {
	
	@Autowired
	private PlatFormDAO p_dao;
	
	int nowPage;
	int rowTotal;
	
	public final int BLOCK_LIST = 10;
	public final int BLOCK_PAGE = 5;
	
	String pageCode;
	
	@RequestMapping("/bbs")
	public ModelAndView netflixList(String cPage) {
		ModelAndView mv = new ModelAndView();
		if(cPage == null) {
			nowPage = 1;
		}else {
			nowPage = Integer.parseInt(cPage);
		}
		
		rowTotal = p_dao.getTotalCount();
		
		Paging page = new Paging(nowPage, rowTotal, BLOCK_LIST, BLOCK_PAGE);
		
		pageCode = page.getSb().toString();
		
		int begin = page.getBegin();
		int end = page.getEnd();
		
		PlatFormVO[] ar = p_dao.ott_All(begin, end);
		mv.addObject("ar",ar);
		
		mv.addObject("nowPage", nowPage);
		mv.addObject("rowTotal", rowTotal);
		mv.addObject("blockList", BLOCK_LIST);
		mv.addObject("pageCode", pageCode);
		mv.setViewName("/bbs/bbs_all");
				
		return mv;
	}
	
	
	
	
}
