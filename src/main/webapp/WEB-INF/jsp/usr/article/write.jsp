<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="게시글 작성" />
<%@ include file="../../common/header.jsp"%>
<script>

	const WriteForm_onSubmit = function(form) {
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
<section>
<form action="/usr/article/doWrite" method="post" onsubmit="WriteForm_onSubmit(this); return false;">
	<div>
		<table class="table max-w-md mx-auto">
			<tr>
						<th>게시판</th>
						<td>
							<div class="flex">
								<div>
									<label class="flex items-center">
										<input class="radio radio-sm" type="radio" name="boardId" value="1" />&nbsp;&nbsp;공지사항
									</label>
								</div>
								<div class="w-16"></div>
								<div>
									<label class="flex items-center">
										<input class="radio radio-sm" type="radio" name="boardId" value="2" checked />&nbsp;&nbsp;자유
									</label>
								</div>
							</div>
						</td>
					</tr>
			<tr>
			 <th>제목</th>
				<td>
			  <input class="h-24" name="title" placeholder="제목을 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="body" class="textarea textarea-bordered h-96 w-full" placeholder="내용을 입력해 주세요"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn bg-yellow-500 w-full">작성하기</button></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="btn btn-normal bg-yellow-500 w-full" onclick="history.back(); return false;">뒤로가기</button>
				</td>
			</tr>
		</table>
	</div>
	</form>
</section>

<%@ include file="../../common/footer.jsp"%>