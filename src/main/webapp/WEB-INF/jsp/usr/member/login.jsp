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
<section>
	<div class="container">
		<form action="/usr/member/doLogin" method="post" onsubmit="loginForm_onSubmit(this); return false;">
			<div class="table max-w-md mx-auto translate-x-1/2">
				<table>
					<tr><th colspan="2">이용하기위해 로그인 해 주세요<i class="fa-solid fa-heart"></i></th></tr>
					<tr>
						<th>아이디</th>
						<td><label class="input input-bordered flex items-center gap-2">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 16 16"
    fill="currentColor"
    class="h-4 w-4 opacity-70">
    <path
      d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
  </svg>
  <input type="text" name="loginId" class="grow" placeholder="Username" />
</label></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><label class="input input-bordered flex items-center gap-2">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 16 16"
    fill="currentColor"
    class="h-4 w-4 opacity-70">
    <path
      fill-rule="evenodd"
      d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z"
      clip-rule="evenodd" />
  </svg>
  <input type="text" name="loginPw" class="grow" placeholder="Password" />
</label></td>
					</tr>
					<tr>
						<td colspan="2"><button class="w-full btn bg-yellow-500">로그인</button></td>
					</tr>
					<tr><td colspan="2"><button	class="btn back p-2 border-2 w-full bg-yellow-500 my-2 rounded-md" onclick="history.back();">뒤로가기</button></td></tr>
				</table>
			</div>
		</form>
	</div>
</section>

<%@ include file="../../common/footer.jsp"%>