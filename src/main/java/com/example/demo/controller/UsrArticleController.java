package com.example.demo.controller;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;
import com.example.demo.dto.Reply;
import com.example.demo.service.ArticleService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {
	
	private ArticleService articleService;
	private UsrReplyController usrReplyController;
	
	public UsrArticleController(ArticleService articleService, UsrReplyController usrReplyController) {
		this.articleService = articleService;
		this.usrReplyController = usrReplyController;
	}
	
	@GetMapping("/usr/article/write")
	public String write() {
		return "usr/article/write";
	}
	
	@PostMapping("/usr/article/doWrite")
	@ResponseBody
	public String doWrite(HttpSession session, String title, String body,@RequestParam(defaultValue = "1") int boardId) {
		
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		articleService.writeArticle(loginedMemberId, title, body, boardId);
		
		int id = articleService.getLastInsertId();
		
		return Util.jsReturn(String.format("%s번 게시글을 작성했습니다.", articleService.getArticleById(id).getId()), String.format("detail?id=%d",articleService.getArticleById(id).getId()));
	}

	@GetMapping("/usr/article/list")
	public String showList(Model model, int boardId, @RequestParam(defaultValue = "1") int cPage) {

		Board board = articleService.getBoardById(boardId);
		
		int limitFrom = (cPage - 1) * 10;
		
		List<Article> articles = articleService.getArticles(boardId, limitFrom);
		int articlesCnt = articleService.getArticlesCnt(boardId);
		
		int totalPagesCnt = (int) Math.ceil((double) articlesCnt / 10);
		
		int from = ((cPage - 1) / 10) * 10 + 1;
		int end = (((cPage - 1) / 10) + 1) * 10;
		
		if (end > totalPagesCnt) {
			end = totalPagesCnt;
		}
		
		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		model.addAttribute("articlesCnt", articlesCnt);
		model.addAttribute("totalPagesCnt", totalPagesCnt);
		model.addAttribute("from", from);
		model.addAttribute("end", end);
		model.addAttribute("cPage", cPage);
		
		return "usr/article/list";
	}
	
	
	@GetMapping("/usr/article/detail")
	public String showDetail(HttpSession session, Model model , int id) {
		
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		Article foundArticle = articleService.getArticleById(id);
		List<Reply> replies = usrReplyController.showReplies(foundArticle.getId());
		model.addAttribute("foundArticle",foundArticle);
		model.addAttribute("loginedMemberId",loginedMemberId);
		model.addAttribute("replies",replies);
		return "usr/article/detail";
	}
	@GetMapping("/usr/article/modify")
	public String modify(Model model, int id) {
		
		Article foundArticle = articleService.getArticleById(id);
		model.getAttribute("foundArticle");
		model.addAttribute("foundArticle",foundArticle);
		return "usr/article/modify";
	}
	@PostMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(HttpSession session, Model model, int id, String title, String body) {
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		Article foundArticle = articleService.getArticleById(id);
	
		model.addAttribute("foundArticle",foundArticle);
		model.addAttribute("loginedMemberId",loginedMemberId);
		
		articleService.modifyArticle(id, title, body);

		return Util.jsReturn(String.format("%s번 게시글을 수정했습니다.", articleService.getArticleById(id)), "/");
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