package com.ott.movie.vo;

public class MovieListVO {
	private String movieNm, openDt, prdtStatNm, repGenreNm, genreAlt, img_url;

	public MovieListVO() {

	}

	public MovieListVO(String movieNm, String openDt, String prdtStatNm, String repGenreNm, String genreAlt) {
		super();
		this.movieNm = movieNm;
		this.openDt = openDt;
		this.prdtStatNm = prdtStatNm;
		this.repGenreNm = repGenreNm;
		this.genreAlt = genreAlt;
	}

	public MovieListVO(String movieNm, String openDt, String prdtStatNm, String repGenreNm, String genreAlt,
			String img_url) {
		super();
		this.movieNm = movieNm;
		this.openDt = openDt;
		this.prdtStatNm = prdtStatNm;
		this.repGenreNm = repGenreNm;
		this.genreAlt = genreAlt;
		this.img_url = img_url;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getPrdtStatNm() {
		return prdtStatNm;
	}

	public void setPrdtStatNm(String prdtStatNm) {
		this.prdtStatNm = prdtStatNm;
	}

	public String getRepGenreNm() {
		return repGenreNm;
	}

	public void setRepGenreNm(String repGenreNm) {
		this.repGenreNm = repGenreNm;
	}

	public String getGenreAlt() {
		return genreAlt;
	}

	public void setGenreAlt(String genreAlt) {
		this.genreAlt = genreAlt;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	/*
	 * public MovieListVO(String movieNm, String openDt, String prdtStatNm, String
	 * repGenreNm, String genreAlt) { super(); this.movieNm = movieNm; this.openDt =
	 * openDt; this.prdtStatNm = prdtStatNm; this.repGenreNm = repGenreNm;
	 * this.genreAlt = genreAlt; }
	 */

}
