<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../includes/header.jsp" %>

<form action="insert" method="post">
<div class="container">
<h2>Board Insert</h2>
<div class="form-group">
		<label for="title">제목:</label> <input type="text"
			class="form-control" id="title" placeholder="Enter title"
			name="title">
	</div>

	<div class="form-group">
		<label for="writer">작성자:</label> <input type="text"
			class="form-control" id="writer" placeholder="Enter writer"
			name="writer" value="<sec:authentication property="principal.user.username"/>" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="content">내용:</label>
		<textarea class="form-control" rows="5" cols="50" id="content" name="content"></textarea>
	</div>

<input type="submit" value="글쓰기">
</div>
</form>