package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.ResultData;
import com.example.demo.service.ArticleService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;
	
	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	

	@GetMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData<Article> doWrite(HttpSession session, String title, String body) {
		
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		if (loginedMemberId == -1) {
			return ResultData.from("F-1", "로그인 후 이용할 수 있는 기능입니다");
		}
		
		if (Util.isEmpty(title)) {
			return ResultData.from("F-2", "제목을 입력해주세요");
		}
		
		if (Util.isEmpty(body)) {
			return ResultData.from("F-3", "내용을 입력해주세요");
		}
		
		articleService.writeArticle(loginedMemberId, title, body);
		
		int id = articleService.getLastInsertId();
		
		return ResultData.from("S-1", String.format("%d번 게시물을 작성했습니다", id), articleService.getArticleById(id));
	}

	@GetMapping("/usr/article/list")
	public String showList(Model model) { // 컨트롤러가 화면단으로 저장하고싶을때 모델에 저장
		List<Article> articles = articleService.getArticles();
		
		model.addAttribute("articles",articles);
		
		return "usr/article/list";
	}
	
	
	@GetMapping("/usr/article/detail")
	public String showDetail(HttpSession session, Model model , int id) {
		
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		
		
		Article foundArticle = articleService.getArticleById(id);
	
		model.addAttribute("foundArticle",foundArticle);
		model.addAttribute("loginedMemberId",loginedMemberId);
		return "usr/article/detail";
	}

	@GetMapping("/usr/article/doModify")
//	@ResponseBody
	public String doModify(HttpSession session, Model model, int id, String title, String body) {
		
		Article foundArticle = articleService.getArticleById(id);
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		model.addAttribute("foundArticle",foundArticle);
		
//		if (loginedMemberId == -1) {
//			return ResultData.from("F-1", "로그인 후 이용할 수 있는 기능입니다");
//		}		
//		if (foundArticle == null) {
//			return ResultData.from("F-1", String.format("%d번 게시물은 존재하지 않습니다", id));
//		}
//		if(loginedMemberId != foundArticle.getMemberId()) {
//			return ResultData.from("F-1", String.format("%d번 게시물은 본인이 작성하지 않았습니다.", id));
//		}
//		ResultData.from("S-1", String.format("%d번 게시물을 수정했습니다", id), articleService.getArticleById(id))
			articleService.modifyArticle(id, title, body);
			return "usr/article/doModify";
	}

	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public String doDelete(HttpSession session, int id) {
		
//		Article foundArticle = articleService.getArticleById(id);
//		int loginedMemberId = -1;
		
//		if (session.getAttribute("loginedMemberId") != null) {
//			loginedMemberId = (int) session.getAttribute("loginedMemberId");
//		}
//		
//		if (loginedMemberId == -1) {
//			return ResultData.from("F-1", "로그인 후 이용할 수 있는 기능입니다");
//		}
//		if (foundArticle == null) {
//			return ResultData.from("F-1", String.format("%d번 게시물은 존재하지 않습니다", id));
//		}
		
//		if(loginedMemberId != foundArticle.getMemberId()) {
//			return ResultData.from("F-1", String.format("%d번 게시물은 본인이 작성하지 않았습니다.", id));
//		}
			articleService.deleteArticle(id);
			
			return Util.jsReturn(String.format("%d번 게시물이 삭제되었습니다.", id), "list" );
	}
}