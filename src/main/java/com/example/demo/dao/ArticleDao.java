package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;

@Mapper
public interface ArticleDao {
	

	@Insert("""
			INSERT INTO article
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{loginedMemberId}
					, title = #{title}
					, `body` = #{body}
					, boardId = #{boardId}
			""")
	public void writeArticle(int loginedMemberId, String title, String body, int boardId);

	@Select("""
			SELECT a.*
					, m.loginId
				FROM article AS a
				INNER JOIN `member` AS m
				ON a.memberId = m.id
				WHERE a.boardId = #{boardId}
				ORDER BY a.id DESC
				LIMIT #{limitFrom}, 10
			""")
	public List<Article> getArticles(int boardId, int limitFrom);

	@Select("""
			SELECT a.*
					, m.loginId
					,b.boardName
				FROM article AS a
				INNER JOIN `member` AS m
				ON a.memberId = m.id
				INNER JOIN board as b
				ON a.boardId = b.id
				WHERE a.id = #{id}
			""")
	public Article getArticleById(int id);
	
	@Select("""
				SELECT *
					FROM article AS a
					INNER JOIN board AS b
					ON a.boardId = b.id
					INNER JOIN `member` as m
					ON a.memberId = m.id
					WHERE a.boardId = #{boardId}
					ORDER BY a.id DESC
					LIMIT  #{limitFrom}, 10 
					
			""")
	public List<Article> getArticleByBoardId(int boardId, int limitFrom);
	
	@Update("""
			<script>
			UPDATE article
				SET updateDate = NOW()
					<if test="title != null and title != ''">
						, title = #{title}
					</if>
					<if test="body != null and body != ''">
						, `body` = #{body}
					</if>
				WHERE id = #{id}
			</script>
			""")
	public void modifyArticle(int id, String title, String body);

	
	@Delete("""
			DELETE FROM article
				WHERE id = #{id}
			""")
	public void deleteArticle(int id);

	@Select("""
			SELECT LAST_INSERT_ID();
			""")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM board
				WHERE id = #{boardId};
			""")
	public Board getBoardById(int boardId);

	@Select("""
			SELECT COUNT(id)
				FROM article
				WHERE boardId = #{boardId}
			""")
	public int getArticlesCnt(int boardId);
}