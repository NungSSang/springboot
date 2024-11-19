<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="상세보기" />
<%@ include file="../../common/header.jsp"%>

<section>
	<div>
		<table class="table table-zebra max-w-md mx-auto">
			<tr>
				<th>게시판 이름</th>
				<td>${foundArticle.getBoardName() }</td>
			</tr>
			<tr>
				<th>번호</th>
				<td>${foundArticle.getId() }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${foundArticle.getLoginId() }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${foundArticle.getRegDate().substring(2,16) }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${foundArticle.getUpdateDate().substring(2,16) }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${foundArticle.getTitle() }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${foundArticle.getBody() }</td>
			</tr>

		</table>
	</div>
	<div class="w-64 mx-auto mt-2 flex justify-between">
		<button class="btn btn-normal bg-yellow-500" onclick="history.back();">뒤로가기</button>
		<c:if test="${rq.getLoginedMemberId() == foundArticle.getMemberId() }">
		<a role="button" class="btn bg-yellow-500" href="/usr/article/modify?id=${foundArticle.getId() }">수정하기</a>
		<a role="button" class="btn bg-yellow-500" href="/usr/article/modify?id=${foundArticle.getId() }"  onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="/usr/article/doDelete?id=${foundArticle.getId() }">삭제하기</a>
		</c:if>
	</div>
</section>
<%@ include file="../../common/footer.jsp"%>