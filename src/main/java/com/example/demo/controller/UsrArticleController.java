package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;

@Controller
public class UsrArticleController {

	Article article;
	int lastArticleId;
	List<Article> articles = new ArrayList<>();
	UsrArticleService uas;

	public UsrArticleController() {
		this.lastArticleId = 0;
		this.articles = new ArrayList<>();
	}

	@GetMapping("/usr/article/doWrite")
	@ResponseBody
	public Article doWrite(String title, String body) {
		lastArticleId++;
		Article article = new Article(lastArticleId, title, body);
		articles.add(article);
		return article;
	}

	@GetMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return articles;
	}
	

//	@GetMapping("/usr/article/detail")
//	@ResponseBody
//	public List<Article> detail(int id) {
//		for(int i = 0; i < articles.size(); i++) {
//			if(article.getId() == id) {
//				return articles;
//			}else {
//				Article article = new Article(0,"없음","없음");
//				return  article;
//			}
//		}
//	}
	
}
