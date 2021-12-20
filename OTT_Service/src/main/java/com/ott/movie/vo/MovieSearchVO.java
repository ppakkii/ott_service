package com.ott.movie.vo;

public class MovieSearchVO {
	private String title;
	private String actor;
	private String link;
	private String image;
	private String director;
	private String userRating;

	public MovieSearchVO(String title, String actor, String link, String image, String director, String userRating) {
		super();
		this.title = title;
		this.actor = actor;
		this.link = link;
		this.image = image;
		this.director = director;
		this.userRating = userRating;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getUserRating() {
		return userRating;
	}

	public void setUserRating(String userRating) {
		this.userRating = userRating;
	}

}
