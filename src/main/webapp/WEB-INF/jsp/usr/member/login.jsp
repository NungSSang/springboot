<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="로그인" />
<%@ include file="../../common/header.jsp"%>

<script>
	
	const loginForm_onSubmit = function(form) {
		form.loginId.value = form.loginId.value.trim()
		form.loginPw.value = form.loginPw.value.trim()
		
		if(form.loginId.value.length == 0){
			alert('아이디를 입력해주세요');
			form.loginId.focus();
			return;
		}
		
		if(form.loginPw.value.length == 0){
			alert('비밀번호를 입력해주세요');
			form.loginPw.focus();
			return;
		}
		
		form.submit();
	} 
	
</script>

<section class="mt-8">
	<div class="container">
		<form action="/usr/member/doLogin" method="post" onsubmit="loginForm_onSubmit(this); return false;">
			<div class="table-box">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="loginId" placeholder="아이디를 입력해주세요"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" name="loginPw" placeholder="비밀번호를 입력해주세요"/></td>
					</tr>
					<tr>
						<td colspan="2"><button class="mx-auto">로그인</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</section>
<div class="btn">
	<button	class="back p-2 border-2 border-black bg-yellow-500 my-2 rounded-md" onclick="history.back();">뒤로가기</button>
	
</div>
<%@ include file="../../common/footer.jsp"%>