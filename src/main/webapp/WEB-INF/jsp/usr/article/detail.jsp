<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="상세보기" />
<%@ include file="../../common/header.jsp"%>

<script>
	console.log("여기");
	const replyWriteForm_onSubmit = function(form){
		form.body.value = form.body.value.trim();
		if(form.body.value.length == 0){
			console.log("여기2");
			alert("댓글써줘");
			form.body.focus();
			return;
		}
		form.submit();
	}
</script>

<section>
	<div class="container mx-auto">
		<table class="table table-zebra max-w-md mx-auto mb-3">
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
			<tr>
		</table>
		<div class="w-64 mx-auto my-3 flex justify-between">
		<button class="btn btn-normal bg-yellow-500" onclick="history.back();">뒤로가기</button>
		<c:if test="${rq.getLoginedMemberId() == foundArticle.getMemberId() }">
		<a role="button" class="btn bg-yellow-500" href="/usr/article/modify?id=${foundArticle.getId() }">수정하기</a>
		<a role="button" class="btn bg-yellow-500" href="/usr/article/modify?id=${foundArticle.getId() }"  onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="/usr/article/doDelete?id=${foundArticle.getId() }">삭제하기</a>
		</c:if>
	</div>
	</div>
	<div class="container mx-auto px-4 text-base">
	<div class="flex justify-center mr-96">댓글</div>
	
	<div class="container">
		<div class="text-lg flex justify-center">
			<form action="/usr/reply/writereply" method="post" onsubmit="replyWriteForm_onSubmit(this); return false;">
				<table>
					<tr>
						<th>댓글작성</th>
							<td><input type="hidden" name="loginedMemberId" value="${rq.getLoginedMemberId() }" /></td>
							<td><input type="hidden" name="relId" value="${foundArticle.getId() }" /></td>
							<td><input type="hidden" name="relTypeCode" value="article" /></td>
							<td><textarea class="textarea textarea-bordered max-h-32" name="body" cols="30" rows="10"></textarea></td>
					</tr>
				</table>
				<button class="btn">댓글전송</button>
			</form>
		</div>
	</div>
	<table class="table table-zebra max-w-md mx-auto mt-3">
		<thead>
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>작성일</td>
			</tr>
		</thead>
		<c:forEach var="reply" items="${replies }">
		<tbody>
			<tr>
				<td>${reply.getLoginId() }</td> 
				<td>${reply.getBody() }</td>
				<td>${reply.getRegDate().substring(2,16) }</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	</div>
</section>


<%@ include file="../../common/footer.jsp"%>