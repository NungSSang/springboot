package com.example.demo.dto;

public class Article {
	int id;
	String title;
	String body;

	public Article(int id , String title, String body) {
		this.title = title;
		this.body = body;
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
}
