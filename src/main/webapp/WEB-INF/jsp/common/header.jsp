<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<!-- 테일윈드 -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- common css -->
<link rel="stylesheet" href="/resource/common.css" />

</head>
<body>
	<div>
	<div class="text-4xl"><a class="text-pink-500" href="/"><i class="fa-solid fa-user-secret">김원준의 홈페이지</i></a></div>
	<ul class="flex justify-left">
		<li class="inline-block mx-3"><a href="/usr/home/main"><i class="fa-solid fa-house"> Home</i></a></li>	
		<li class="inline-block"><a href="/usr/article/list"><i class="fa-solid fa-list"> List</i></a></li>
			<c:if test="${rq.getLoginedMemberId() == -1 }">
				<li class="hover:underline ml-auto mr-25" ><a class="h-full px-3" href="${pageContext.request.contextPath }/usr/member/login">로그인</a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != -1 }">
				<li class="hover:underline ml-auto mr-25"><a class="h-full px-3" href="${pageContext.request.contextPath }/usr/member/doLogout">로그아웃</a></li>
			</c:if>
	</ul>
	</div>

	<section>
	<div>
		<div class="mx-3">${pageTitle }&nbsp;페이지</div>
	</div>
	</section>