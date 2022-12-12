<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">
	<h3>회원관리</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>비밀번호</th>
				<th>회원등급</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users }" var="user">
				<tr>
					<td>${user.id }</td>
					<td>${user.email }</td>
					<td>${user.password}</td>
					<td>${user.role }</td>
					<td>${user.username }</td>
				
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


