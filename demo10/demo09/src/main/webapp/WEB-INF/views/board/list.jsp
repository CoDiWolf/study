<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">
	<h3>게시판(${count })</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${board.content}" var="board" varStatus="st">
				<tr>
					<td>${board.num}</td>
					<td><a href="view/${board.num }">${board.title }[${board.replyCnt }]</a></td>
					<td>${board.user.username}</td>
					<td><fmt:formatDate value="${board.regdate }"
							pattern="yyyy-MM-dd" /></td>
					<td>${board.hitcount }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="d-flex justify-content-between mt-5 mr-auto">
		<ul class="pagination">
			<c:if test="${board.first==false }">
				<li class="page-item"><a class="page-link"
					href="?page=${board.number-1 }">이전</a></li>
			</c:if>

			<c:if test="${board.last==false }">
				<li class="page-item"><a class="page-link"
					href="?page=${board.number+1 }">다음</a></li>
			</c:if>
		</ul>
		<div>
			<form class="form-inline" action="/board/list" method="get">
				<select name='field' id="field" class="form-control mr-sm-1">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type='text' name='word' class="form-control"
					placeholder="Search">
				<button class='btn btn-secondary'>Search</button>
			</form>
		</div>
	</div>
</div>



