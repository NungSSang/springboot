<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() }게시판" />	
<%@ include file="../../common/header.jsp"%>

<script>
	 let validLoginId = null;
	
	const joinForm_onSubmit = function(form) {
		form.loginId.value = form.loginId.value.trim()
		form.loginPw.value = form.loginPw.value.trim()
		
		if(form.name.value.length == 0){
			alert('별명을 입력해주세요');
			form.name.focus();
			return;
		}
		
		if(form.loginId.value.length == 0){
			alert('아이디를 입력해주세요');
			form.loginId.focus();
			return;
		}
		
		if(form.loginId.value != validLoginId){
			alert('사용 불가능한 아이디 입니다.');
			form.loginId.focus();
			return;
		}
		
		if(form.loginId.value != form.loginCheckId.value){
			alert('[' + form.longinId.value + '] 는 사용할 수 없는 아이디 입니다.');
			form.loginId.value ='';
			form.loginCheckId.focus();
			return;
		}
		if(form.loginPw.value.length == 0){
			alert('비밀번호를 입력해주세요');
			form.loginPw.focus();
			return;
		}
		
		if(form.loginPw.value != form.loginCheckPw.value){
			alert('비밀번호를 확인 해주세요');
			form.loginPw.value = '';
			form.loginCheckPw.focus();
			return;
		}
		
		form.submit();
	} 

	const dupleCheck = function(el){
		el.value = el.value.trim();
		
		
		let loginIddupCheck = $('#loginDuple');
		if(el.value.length == 0){
			loginIddupCheck.removeClass('text-green-500');
			loginIddupCheck.addClass('text-red-500');
			loginIddupCheck.html(`<span>아이디에 공백은 안돼</span>`)
			return false;
		}
		$.ajax({
			url : '/usr/member/joinDuplication',
			type : 'GET',
			data : {
				loginId : el.value,
			},
			dataType : 'json',
			success : function(data) {
				if(data.success){
					loginIddupCheck.html(`<span>\${data.resultMsg }</span>`)
					loginIddupCheck.removeClass('text-red-500');
					loginIddupCheck.addClass('text-green-500');
					validLoginId = el.value;
				}else{
					loginIddupCheck.removeClass('text-green-500');
					loginIddupCheck.addClass('text-red-500');
					loginIddupCheck.html(`<span>\${data.resultMsg }</span>`)
					validLoginId = null;
				}
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
	}

</script>

<section>
<section>
	<div class="container">
		<form action="/usr/member/doJoin" method="post" onsubmit="joinForm_onSubmit(this); return false;">
			<div class="table max-w-md mx-auto translate-x-1/2">
				<table>
					<tr><th colspan="2">회원가입 페이지 입니다. 환영합니다~<i class="fa-solid fa-heart"></i></th></tr>
					<tr>
						<th>닉네임</th>
						<td><label class="input input-bordered flex items-center gap-2">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 16 16"
    fill="currentColor"
    class="h-4 w-4 opacity-70">
    <path
      d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
  </svg>
  <input type="text" name="name" class="grow" placeholder="NickName" />
</label></td>
					</tr>
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
  <input type="text" name="loginId" class="grow" placeholder="Username" onblur="dupleCheck(this);" />
</label>
<div id="loginDuple" class="mt-3"></div>
</td>
					</tr>
						<tr>
						<th>아이디 중복체크</th>
						<td><label class="input input-bordered flex items-center gap-2">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 16 16"
    fill="currentColor"
    class="h-4 w-4 opacity-70">
    <path
      d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
  </svg>
  <input type="text" name="loginCheckId" class="grow" placeholder="Check Username" />
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
						<th>비밀번호 중복체크</th>
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
  <input type="text" name="loginCheckPw" class="grow" placeholder="Check Password"  />
</label></td>
					</tr>
					<tr>
						<td colspan="2"><button class="w-full btn bg-yellow-500">회원가입</button></td>
					</tr>
					<tr><td colspan="2"><button	class="btn back p-2 border-2 w-full bg-yellow-500 my-2 rounded-md" onclick="history.back();">뒤로가기</button></td></tr>
				</table>
			</div>
		</form>
	</div>
</section>

</section>


<%@ include file="../../common/footer.jsp"%>