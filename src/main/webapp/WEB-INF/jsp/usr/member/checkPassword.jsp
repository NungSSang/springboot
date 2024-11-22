<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<c:set var="pageTitle" value="비밀번호 확인" />
<%@ include file="../../common/header.jsp"%>

<script>
	const CheckPasswordForm_onSubmit = function(form) {
		form.loginPw.value = form.loginPw.value.trim()
		if(form.loginPw.value.length == 0){
			alert('비밀번호를 입력해 주세요.');
			form.loginPw.focus();
			return;
		}
		if(form.loginPw.value != '${member.getLoginPw() }'){
			alert('비밀번호가 다릅니다.');
			form.loginPw.focus();
			return;
		}
		form.submit();
	}
	
</script>

<section>
	<div class="container">
		<form action="/usr/member/modifyPassword?id=${member.getId() }" method="post" onsubmit="CheckPasswordForm_onSubmit(this); return false;">
			<div class="table max-w-md mx-auto translate-x-1/2">
				<table>
					<tr>
						<th colspan="2">비밀번호 확인 페이지 입니다<i class="fa-solid fa-heart"></i></th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><label class="input input-bordered flex items-center gap-2"> 
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
    							<path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" />
  							</svg> 
  							<input type="text" name="loginPw" class="grow" placeholder="Password"/>
						</label></td>
						
					<tr>
						<td colspan="2"><button class="w-full btn bg-yellow-500">비밀번호 확인</button></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn w-full bg-yellow-500 " onclick="history.back(); return false;">뒤로가기</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</section>

<%@ include file="../../common/footer.jsp"%>