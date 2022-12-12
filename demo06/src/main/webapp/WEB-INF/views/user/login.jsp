<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
<h3>LOG IN</h3>
<form action="/login" method="post">
	<div class="form-group">
		<label for="username">아이디:</label> <input type="text" id="username" name="username"
			class="form-control" placeholder="Enter ID" />
	</div>

	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password" placeholder="Enter password" name="password">
	</div>
	<button class="btn btn-info">로그인</button>
</form>
</div>