package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;
import com.example.demo.dto.Board;

@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
	public void writeArticle(int loginedMemberId, String title, String body, int boardId) {
		articleDao.writeArticle(loginedMemberId, title, body, boardId);
	}

	public List<Article> getArticles(int boardId, int limitFrom, String searchKeyword, String searchType) {
		return articleDao.getArticles(boardId, limitFrom, searchKeyword, searchType);
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	
	public List<Article> getArticleByBoardId(int boardId, int limitFrom) {
		return articleDao.getArticleByBoardId(boardId, limitFrom);
	}

	public void modifyArticle(int id, String title, String body) {
		articleDao.modifyArticle(id, title, body);
	}

	public void deleteArticle(int id) {
		articleDao.deleteArticle(id);
	}

	public int getLastInsertId() {
		return articleDao.getLastInsertId();
	}

	public Board getBoardById(int boardId) {
		return articleDao.getBoardById(boardId);
	}

	public int getArticlesCnt(int boardId, String searchKeyword, String searchType) {
		return articleDao.getArticlesCnt(boardId, searchKeyword, searchType);
	}

	public void increseViews(int id) {
		articleDao.increseViews(id);
	}


	
}