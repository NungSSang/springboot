<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() }게시판" />	
<%@ include file="../../common/header.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
	<div class="flex justify-between itmes-end">
	<div class="w-9/12 ml-auto mr-20 mb-3 pl-3 text-sm">총 : ${articlesCnt }개의 게시글</div>
		<form>
			<input type="hidden" name="boardId" value="${board.getId() }"/>
			<select class="select select-bordered w-full max-w-xs" name="searchType">
				<option value="title" <c:if test="${searchType == 'title' }">selected="selected"</c:if>>제목</option>
						<option value="body" <c:if test="${searchType == 'body' }">selected="selected"</c:if>>내용</option>
						<option value="title,body" <c:if test="${searchType == 'title,body' }">selected="selected"</c:if>>제목 + 내용</option>
				
			</select>
			<label class="input input-bordered flex items-center gap-2">
			  <input type="text" class="grow" name="searchKeyword" placeholder="Search" value="${searchKeyword }"/>
			  <svg
			    xmlns="http://www.w3.org/2000/svg"
			    viewBox="0 0 16 16"
			    fill="currentColor"
			    class="h-4 w-4 opacity-70">
			    <path
			      fill-rule="evenodd"
			      d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
			      clip-rule="evenodd" />
			  </svg>
			</label>
		</form>
	</div>
	<div class="overflow-x-auto table-box">
	<table class="table table-lg max-w-4xl mx-auto">
		<colgroup>
			<col width="60"/>
			<col />
			<col  width="60"/>
			<col  width="200"/>
			<col  width="40"/>
		</colgroup>
		<thead>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<c:forEach var="article" items="${articles }">
			<tbody>
				<tr>
					<td>${article.getId() }</td>
					<td class="hover:underline hover:bg-pink-400 hover:text-white"><a href="/usr/article/detail?id=${article.getId() }">${article.getTitle() }</a></td>
					<td>${article.getLoginId() }</td>
					<td>${article.getRegDate().substring(2,16) }</td>
					<td>${article.getViews() }</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	</div>
	</div>
</section>
<div class="mt-2 flex justify-center">
			<div class="join">
				<c:set var="path" value="?boardId=${board.getId() }&searchType=${searchType }&searchKeyword=${searchKeyword }" />
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