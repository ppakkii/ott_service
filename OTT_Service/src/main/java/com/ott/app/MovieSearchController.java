package com.ott.app;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.util.ArrayList;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ott.dao.PlatFormDAO;
import com.ott.movie.vo.MovieSearchVO;

@Controller
public class MovieSearchController {

	private final static String CLIENTID = "pprdCX9qYCGWYhUNLocM";
	private final static String CLIENTSECRET = "CskFbXpBlr";
	String text = null;
	
	@Autowired
	PlatFormDAO p_dao;

	@RequestMapping("/search")
	public ModelAndView naver_searchAPI(String s_movie) throws Exception {
		ModelAndView mv = new ModelAndView();
		int idx = p_dao.getIdx(s_movie);
		if(idx > 0) {
			mv.setViewName("redirect:/review?ott_idx="+idx);
		}else {
		

		HttpURLConnection con = null;
		String text = URLEncoder.encode(s_movie, "UTF-8");
		

		String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=";

		StringBuffer sb = new StringBuffer();
		sb.append(apiURL);
		sb.append(text);

		URL url = new URL(sb.toString());
		con = (HttpURLConnection) url.openConnection();

		// REST-API : Header �슂泥�
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", CLIENTID);
		con.setRequestProperty("X-Naver-Client-Secret", CLIENTSECRET);

		List<MovieSearchVO> list = new ArrayList<MovieSearchVO>();
		int responseCode = con.getResponseCode();

		if (responseCode == HttpURLConnection.HTTP_OK) {
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));

			StringBuffer result = new StringBuffer();
			String read = "";

			while ((read = br.readLine()) != null) {

				if (read != null) {
					result.append(read);
				}
			}

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(result.toString());
			JSONObject json_obj = (JSONObject) obj; // lastBuildDate

			JSONArray json_ar = (JSONArray) json_obj.get("items");

			for (int i = 0; i < json_ar.size(); i++) {

				JSONObject json_obj2 = (JSONObject) json_ar.get(i);

				String title = (String) json_obj2.get("title");
				String actor = (String) json_obj2.get("actor");
				String link = (String) json_obj2.get("link");
//				String image = (String) json_obj2.get("image"); �씠誘몄�
				String image = (String) json_obj2.get("image"); 
				String director = (String) json_obj2.get("director");
				String userRating = (String) json_obj2.get("userRating");
				
				if (json_obj2 != null) {
					MovieSearchVO vo = new MovieSearchVO(title, actor, link, image, director, userRating);
					list.add(vo);
				}

			}
		} else {
			System.out.print("�쓳�떟�떎�뙣");
		}

		mv.addObject("list", list);
		mv.setViewName("movie_search");
		}
		return mv;
	}

}


