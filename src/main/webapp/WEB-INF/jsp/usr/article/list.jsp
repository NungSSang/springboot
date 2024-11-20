<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() }게시판" />	
<%@ include file="../../common/header.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
	<div class="w-9/12 ml-auto mr-20 mb-3 pl-3 text-sm">총 : ${articlesCnt }개의 게시글</div>
	<div class="overflow-x-auto table-box">
	<table class="table table-lg max-w-4xl mx-auto">
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
	</div>
</section>
<div class="mt-2 flex justify-center">
			<div class="join">
				<c:set var="path" value="?boardId=${board.getId() }" />
				<c:if test="${from != 1 }">
					<a class="join-item btn btn-sm" href="${path }&cPage=1"><i class="fa-solid fa-angles-left">처음</i></a>
					<a class="join-item btn btn-sm" href="${path }&cPage=${from - 1 }"><i class="fa-solid fa-angle-left">이전</i></a>
				</c:if>
				
				<c:forEach var="i" begin="${from }" end="${end }">
					<a class="join-item btn btn-sm ${cPage == i ? 'btn-active' : '' }" href="${path }&cPage=${i }">${i }</a>
				</c:forEach>
				
				<c:if test="${end != totalPagesCnt }">
					<a class="join-item btn btn-sm" href="${path }&cPage=${end + 1 }"><i class="fa-solid fa-angle-right">다음</i></a>
					<a class="join-item btn btn-sm" href="${path }&cPage=${totalPagesCnt }"><i class="fa-solid fa-angles-right">마지막</i></a>
				</c:if>
			</div>
		</div>
<%@ include file="../../common/footer.jsp"%>