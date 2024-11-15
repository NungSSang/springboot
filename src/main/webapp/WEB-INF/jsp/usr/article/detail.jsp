<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="상세보기" />
<%@ include file="../../common/header.jsp"%>

<section>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<td>${foundArticle.getId() }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${foundArticle.getLoginId() }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${foundArticle.getTitle() }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${foundArticle.getBody() }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${foundArticle.getRegDate().substring(2,16) }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${foundArticle.getUpdateDate().substring(2,16) }</td>
			</tr>
		</table>
	</div>
	<div class="btn">
		<button class="back p-2 border-2 border-black bg-yellow-500 my-2 rounded-md" onclick="history.back();">뒤로가기</button>
		
		
		<c:if test="${rq.getLoginedMemberId() == foundArticle.getMemberId() }">
		<a class="delete p-2 border-2 border-black bg-yellow-500 my-2 rounded-md" href="doModify?id=${foundArticle.getId() }">수정하기</a>
		<a class="delete p-2 border-2 border-black bg-yellow-500 my-2 rounded-md" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"  href="/usr/article/doDelete?id=${foundArticle.getId() }">삭제</a>
		</c:if>
	</div>
</section>
<%@ include file="../../common/footer.jsp"%>