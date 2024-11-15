<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="목록" />	
<%@ include file="../../common/header.jsp"%>



<section>
	<div>
	<table border=1>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</thead>
		<c:forEach var="article" items="${articles }">
			<tbody>
				<tr>
					<td>${article.getId() }</td>
					<td class="hover:underline hover:bg-pink-400 hover:text-white"><a href="/usr/article/detail?id=${article.getId() }">${article.getTitle() }</a></td>
					<td>${article.getLoginId() }</td>
					<td>${article.getRegDate().substring(2,16) }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	</div>
</section>
<%@ include file="../../common/footer.jsp"%>