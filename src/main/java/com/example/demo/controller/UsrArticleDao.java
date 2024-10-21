package com.example.demo.controller;

import com.example.demo.dto.Article;

public class UsrArticleDao {
	
	Article article;
	UsrArticleService uas;
	public String returnTitle() {

		return article.getTitle();
	}

	public String returnBody() {

		return article.getBody();
	}
	
	public String earnTitle() {
		return "";
	}
}
