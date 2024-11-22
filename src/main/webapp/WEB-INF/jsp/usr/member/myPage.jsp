<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="마이" />
<%@ include file="../../common/header.jsp"%>


<section>
	<section>
		<div class="container">
			<div class="table mx-auto translate-x-1/2">
				<table>
					<tr>
						<th colspan="2">마이 페이지<i class="fa-solid fa-heart"></i></th>
					</tr>
					<tr>
						<th>내 아이디</th>
						<td>${member.getLoginId() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${member.getName() }</td>
					</tr>
					<tr>
						<th>생성 날짜</th>
						<td>${member.getRegDate() }</td>
					</tr>
					<tr>
						<th>수정 날짜</th>
						<td>${member.getUpdateDate() }</td>
					</tr>
					<tr>
						<td colspan="2"><a class="btn bg-yellow-500 w-full" href="checkPassword?id=${member.getId() }">수정하기</a></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn w-full bg-yellow-500" onclick="history.back();">뒤로가기</button></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</section>


<%@ include file="../../common/footer.jsp"%>