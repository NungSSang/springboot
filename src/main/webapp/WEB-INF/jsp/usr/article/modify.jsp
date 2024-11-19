<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="수정하기" />
<%@ include file="../../common/header.jsp"%>

<script>

	const ModifyForm_onSubmit = function(form) {
		form.title.value = form.title.value.trim()
		form.body.value = form.body.value.trim()
		
		if(form.title.value.length == 0){
			alert('제목은 공백이 불가능 합니다.');
			form.title.focus();
			return;
		}
		
		if(form.body.value.length == 0){
			alert('내용은 공백이 불가능 합니다.');
			form.body.focus();
			return;
		}
		form.submit();
	} 
</script>
<section class="mx-auto w-96">
	<div>
	<form action="/usr/article/doModify?id=${foundArticle.getId() }&boardId=${foundArticle.getBoardId() }" method="post" onsubmit="ModifyForm_onSubmit(this); return false;">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>${foundArticle.getId() }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${foundArticle.getRegDate() }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${foundArticle.getUpdateDate() }</td>
			</tr>
			<tr class="mx-auto" >
                <th>수정할 제목</th>
				<td>
			  <input name="title"  value="${foundArticle.getTitle() }"/>
				</td>
			</tr>
			<tr>
				<th>수정할 내용</th>
				<td><textarea name="body" class="textarea textarea-bordered h-36" placeholder="${foundArticle.getBody() }"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn w-full bg-yellow-500">수정하기</button></td>
			</tr>
			<tr><td colspan="2"><button class="btn w-full bg-yellow-500" onclick="history.back();">뒤로가기</button></td></tr>
		</table>
		</form>
	</div>
</section>
<section>
</section>

<div class="mx-auto w-96">

</div>
<%@ include file="../../common/footer.jsp"%>