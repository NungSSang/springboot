<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="수정하기" />
<%@ include file="../../common/header.jsp"%>

<section>
	<div>
	<form action="/usr/article/doModify">
		<table>
			<tr>
				<th>제목</th>
				<td>${foundArticle.getTitle() }<input type="text" name="title"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${foundArticle.getBody()  }<input type="text" name=body/></td>
			</tr>
		</table>
		</form>
	</div>
</section>
<div>

	<a
		class="delete p-2 border-2 border-black bg-yellow-500 my-2 rounded-md"
		onclick="if(confirm('정말 수정하시겠습니까?') == false) return false;"
		href="/usr/article/list">수정하기</a>
		
		
	<button
		class="back p-2 border-2 border-black bg-yellow-500 my-2 rounded-md"
		onclick="history.back();">뒤로가기</button>
</div>
<%@ include file="../../common/footer.jsp"%>