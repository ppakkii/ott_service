package com.ott.app;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ott.movie.vo.MovieListVO;

@Controller
public class MovieShowTestController {
	
	@Autowired
	HttpServletRequest request;
	/*
	@RequestMapping(value ="/", method = RequestMethod.POST)
	public String showMonth(Model model) throws Exception {
		System.out.println("ShowMonth()");
		StringBuffer sb = new StringBuffer();
		sb.append("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml");
		sb.append("?key=88aadd02552e7cb68fb81746ad737386");
		sb.append("&openStartDt=2021");
		
		URL url = new URL(sb.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "applicaiton/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		Element movieList = root.getChild("movieList");
		List<Element> movie = movieList.getChildren("movie");
		//System.out.println(movie.size()); //10
		
		MovieListVO[] mvo = new MovieListVO[movie.size()];
		
		// �ݺ��� ������ �迭�� �� �ֱ�
		int i = 0;
		for(Element vo : movie) {
			String movieNm = vo.getChildText("movieNm");
			String openDt = vo.getChildText("openDt");
			String prdtStatNm = vo.getChildText("prdtStatNm");
			String genreAlt = vo.getChildText("genreAlt");
			String repGenreNm = vo.getChildText("repGenreNm");
			
			MovieListVO m_vo = new MovieListVO(movieNm, openDt, prdtStatNm, repGenreNm, genreAlt);
			
			mvo[i++] = m_vo;
		}
		model.addAttribute("mvo", mvo);		
		return "/movie/movie_test";
	}
	*/
	
	@RequestMapping("/movie")
	@ResponseBody
	public Map<String, Object> show() throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml");
		sb.append("?key=88aadd02552e7cb68fb81746ad737386");
		sb.append("&openStartDt=2021");
		
		URL url = new URL(sb.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "applicaiton/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		Element movieList = root.getChild("movieList");
		List<Element> movie = movieList.getChildren("movie");
		//System.out.println(movie.size()); //10
		
		MovieListVO[] mvo = new MovieListVO[movie.size()];
		
		// 
		int i = 0;
		for(Element vo : movie) {
			String movieNm = vo.getChildText("movieNm");
			String openDt = vo.getChildText("openDt");
			String prdtStatNm = vo.getChildText("prdtStatNm");
			String genreAlt = vo.getChildText("genreAlt");
			String repGenreNm = vo.getChildText("repGenreNm");
			
			MovieListVO m_vo = new MovieListVO(movieNm, openDt, prdtStatNm, repGenreNm, genreAlt);
			
			mvo[i++] = m_vo;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mvo", mvo);
		return map;
	}
	
	
	
	
	
	// Test - 성민
	/*
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String showMonth(Model model) throws Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.xml");
		sb.append("?key=88aadd02552e7cb68fb81746ad737386");
		sb.append("&openStartDt=2021");
		sb.append("&itemPerPage=100");
		
		URL url = new URL(sb.toString());
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestProperty("Content-Type", "applicaiton/xml");
		conn.connect();
		
		SAXBuilder builder = new SAXBuilder();
		
		Document document = builder.build(conn.getInputStream());
		Element root = document.getRootElement();
		Element movieList = root.getChild("movieList");
		List<Element> movie = movieList.getChildren("movie");
		//System.out.println(movie.size()); //10
		
		MovieListVO[] mvo = new MovieListVO[movie.size()];
		
		int i = 0;
		for(Element vo : movie) {
			String movieNm = vo.getChildText("movieNm");
			String openDt = vo.getChildText("openDt");
			String prdtStatNm = vo.getChildText("prdtStatNm");
			String genreAlt = vo.getChildText("genreAlt");
			String repGenreNm = vo.getChildText("repGenreNm");
			
			MovieListVO m_vo = new MovieListVO(movieNm, openDt, prdtStatNm, repGenreNm, genreAlt);
			
			mvo[i++] = m_vo;
		}
		
		model.addAttribute("mvo",mvo);
		
		return "index";
	}
	*/
}
