package com.ott.app;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Document;

import org.jdom2.Element;
import org.jsoup.Jsoup;

import org.jsoup.nodes.*;
import org.jsoup.select.Elements;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ott.dao.PlatFormDAO;
import com.ott.movie.vo.MovieListVO;
import com.ott.platform.vo.PlatFormVO;

@Controller
public class MainController {

	@Autowired
	private PlatFormDAO n_dao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView service_data() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		StringBuffer sb = new StringBuffer();
		sb.append("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml");
		sb.append("?key=88aadd02552e7cb68fb81746ad737386");
		sb.append("&openStartDt=2021");
		sb.append("&itemPerPage=20");

		URL url = new URL(sb.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestProperty("Content-Type", "applicaiton/xml");
		conn.connect();

		SAXBuilder builder = new SAXBuilder();

		Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		Element movieList = root.getChild("movieList");
		List<Element> movie = movieList.getChildren("movie");
		// System.out.println(movie.size()); //10

		MovieListVO[] mvo = new MovieListVO[movie.size()];

		int i = 0;
		for (Element vo : movie) {
			String movieNm = vo.getChildText("movieNm");
			String openDt = vo.getChildText("openDt");
			String prdtStatNm = vo.getChildText("prdtStatNm");
			String genreAlt = vo.getChildText("genreAlt");
			String repGenreNm = vo.getChildText("repGenreNm");
			
			// movie name => jsoup => img_url = jsoup_search(movieNm)

			MovieListVO m_vo = new MovieListVO(movieNm, openDt, prdtStatNm, repGenreNm, genreAlt, jsoup_search(movieNm));

			mvo[i++] = m_vo;
			
		}

		// Jsoup Test..

		/* 테스트 코드 */
		PlatFormVO[] netflix = n_dao.ott_All(1, 10);
		PlatFormVO[] watcha = n_dao.ott_All(11, 20);
		PlatFormVO[] wavve = n_dao.ott_All(21, 30);
		int n_min = n_dao.getMinidx("NETFLIX");
		int w_min = n_dao.getMinidx("WATCHA");
		int v_min = n_dao.getMinidx("WAVVE");
		int n_ran = (int)((Math.random()*10)+n_min);
		int w_ran = (int)((Math.random()*10)+w_min);
		int v_ran = (int)((Math.random()*10)+v_min);
		
		PlatFormVO rvo = n_dao.getRandom(n_ran);
		PlatFormVO wvo = n_dao.getRandom(w_ran);
		PlatFormVO vvo = n_dao.getRandom(v_ran);
		
		mv.addObject("rvo", rvo);
		mv.addObject("wvo", wvo);
		mv.addObject("vvo", vvo);
		mv.addObject("netflix", netflix);
		mv.addObject("watcha", watcha);
		mv.addObject("wavve", wavve);
		mv.addObject("mvo", mvo);
		
		mv.setViewName("index");

		return mv;
	}
	
	// Item Search 크롤링
	private String jsoup_search(String title) throws IOException {
		
		String img_url = "";
		String getJsoupURL = "https://movie.naver.com/movie/search/"
				+ "result.naver?section=movie&query="+title;
		
		org.jsoup.nodes.Document jsoup_doc = Jsoup.connect(getJsoupURL).get();

		Elements obj_section = jsoup_doc.select(".result_thumb");

		int i = 0;
		for (org.jsoup.nodes.Element e : obj_section.select("img")) {
			img_url = e.attr("src");
			// System.out.println(img_url);
			i ++;
			if (i > 0 ) {
				break;
			}
		}
		return img_url;

	}
	
	@RequestMapping("/goReview")
	public ModelAndView goReview(String title) {
		ModelAndView mv = new ModelAndView();
		
		int idx = n_dao.getIdx(title);
		mv.setViewName("redirect:/showReview?ott_idx="+idx);
		
		return mv;
	}

}
