<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
<h3>${board.user.username } 의 글 수정하기</h3>
<input type="hidden" name="num" id="num" value="${board.num }" />
	<div class="form-group">
		<label for="title">제목:</label> <input type="text" class="form-control"
			id="title" name="title" value="${board.title }">
	</div>
	<div class="form-group">
		<label for="writer">글쓴이:</label> <input type="text" class="form-control"
			id="writer" name="writer" value="${board.user.username }" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<textarea class="form-control" rows="5" id="content" name="content">${board.content }</textarea>
	</div>
	
	<div class="form-group text-right">
		<button type="button" class="btn btn-secondary btn-sm" id="btnModify">수정하기</button>
	</div>
	
</div>

<script>
$("#btnModify").click(function() {
	data={
			"num":$("#num").val(),
			"title":$("#title").val(),
			"content":$("#content").val()
	}
	$.ajax({
		type:'put',
		url:'/board/update',
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify(data),
		success:function(resp){
			if(resp=="success"){
				alert("수정 성공")
				location.href='/board/list'
			}//if
		}//success
	})//ajax
})//btnModify
</script>






