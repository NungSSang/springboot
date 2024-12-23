<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<!-- 테일윈드 -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- 데이지유아이 -->
<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css"
	rel="stylesheet" type="text/css" />
<!-- 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- common css -->
<link rel="stylesheet" href="/resource/common.css" />

</head>


<body>
	<div>
		<div class="text-4xl p-2">
			<a class="text-pink-500" href="/"><i class="fa-solid fa-user-secret">김원준의 홈페이지</i></a>
		</div>

		<div class="navbar bg-base-100">
			<div class="flex-1">
				<a class="btn btn-ghost text-xl" href="/usr/home/main"><i class="fa-solid fa-house"> Home</i></a>
			</div>
			<div class="flex-none">
				<ul class="menu menu-horizontal px-1">
					<c:if test="${rq.getLoginedMemberId() != -1 }">
						<li><a href="/usr/article/write"><i class="fa-regular fa-pen-to-square"> 글쓰기</i></a></li>
					</c:if>
					<li>
						<details>
							<summary><i class="fa-solid fa-list"> 게시판</i></summary>
							<ul class="bg-base-100 rounded-t-none">
								<li class="link link-hover -mt-2"><a class="h-full px-3 whitespace-nowrap flex items-center" href="${pageContext.request.contextPath}/usr/article/list?boardId=1&cPage=1">공지사항</a></li>
								<li class="link link-hover"><a class="h-full px-3 whitespace-nowrap flex items-center" href="${pageContext.request.contextPath}/usr/article/list?boardId=2&cPage=1">자유게시판</a></li>
							</ul>
						</details>
					</li>
					<c:if test="${rq.getLoginedMemberId() == -1 }">
						<li class="hover:underline ml-auto mr-25"><a class="h-full px-3" href="${pageContext.request.contextPath }/usr/member/join"><i class="fa-solid fa-person"> 회원가입</i></a></li>
						<li class="hover:underline ml-auto mr-25"><a class="h-full px-3" href="${pageContext.request.contextPath }/usr/member/login"><i class="fa-solid fa-person"> 로그인</i></a></li>
					</c:if>
					<c:if test="${rq.getLoginedMemberId() != -1 }">
						<li class="hover:underline ml-auto"><a class="h-full px-3" href="${pageContext.request.contextPath }/usr/member/myPage"><i class="fa-solid fa-person">마이페이지</i></a></li>
						<li class="hover:underline ml-auto mr-9"><a class="h-full px-3" href="${pageContext.request.contextPath }/usr/member/doLogout"><i class="fa-solid fa-person">로그아웃</i></a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<div>
		<a href="https://comic.naver.com/index" target="_black">d</a>
	</div>
	<section>
			<div class="mx-3">${pageTitle }&nbsp;페이지</div>
	</section>