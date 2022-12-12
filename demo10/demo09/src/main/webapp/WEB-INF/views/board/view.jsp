<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>
<div class="container">
	<h2>Board view</h2>
	<div class="form-group">
		<label for="num">글번호:</label> <input type="text" class="form-control"
			id="num" name="num" value="${board.num }" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="subject">제목:</label> <input type="text"
			class="form-control" id="title" placeholder="Enter title"
			name="title" value="${board.title }" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="pwd">글쓴이:</label> <input type="text"
			class="form-control" id="writer" placeholder="Enter writer"
			name="writer" value="${board.user.username }" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="email">내용:</label>
		<textarea class="form-control" rows="5" id="content" name="content"
			readonly="readonly">${board.content }</textarea>
	</div>
	
<sec:authorize access="isAuthenticated()">
<c:if test="${principal.user.username==board.user.username }">
	<input type="button" value="수정" id="btnUpdate">
	<input type="button" value="삭제" id="btnDelete"> <br><br>	
</c:if>
</sec:authorize>

	<div align="center">
		<textarea rows="3" cols="50" id="msg"></textarea>
		<button type="button" class="btn btn-secondary btn-sm" id="btnComment">댓글쓰기</button>
	</div>
	
	<hr>
	<div id="replyResult"></div>
	
</div>

<script>
//댓글 전체보기
var init = function(){
	$.ajax({
		type:"get",
		url:"/reply/list/"+$("#num").val()
	})//ajax
	.done(function(resp){
		var str="<table class='table table-hover'>"
		$.each(resp, function(key, val){
			str+="<tr>"
			str+="<td>"+val.user.id+"</td>"
			str+="<td>"+val.content+"</td>"
			str+="<td>"+val.regdate+"</td>"
			str+="<td><a href='javascript:fdel("+val.cnum+")'>삭제</a></td>"
			str+="</tr>"
		})//each
		str+="</table>"
		$("#replyResult").html(str);
	})//done
}//init

//댓글삭제
function fdel(cnum) {
	$.ajax({
		type:"delete",
		url:'/reply/delete/'+cnum
	})//ajax
	.done(function(resp){
		alert(resp+"번 댓글 삭제 완료")
		init()
	}).fail(function(e){
		alert("댓글 삭제 실패"+e)
	})
}

//댓글추가
$("#btnComment").click(function(){
	if(${empty principal.user}){
		alert("로그인 하세요");
		location.href="/login";
		return;
	}
	if($("#msg").val()==""){
		alert("댓글을 적으세요")
		return;
	}
	var data={
			"bnum":$("#num").val(),
			"content":$("#msg").val()
	}
	$.ajax({
		type:"POST",
		url:"/reply/insert/"+$("#num").val(),
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp, status){
		alert(status)
		alert("댓글 추가성공")
		init();
	})
	.fail(function(e){
 		alert("댓글 추가실패")
	})
})

//수정폼
$("#btnUpdate").click(function(){
	if(confirm("정말 수정할까요?")){
		location.href="/board/update/${board.num}"
	}
})

//삭제
$("#btnDelete").click(function(){
	if(!confirm("정말 삭제할까요?"))return
	$.ajax({
		type:"delete",
		url:"/board/delete/${board.num}",
		success:function(resp){
			if(resp=="success"){
				alert("삭제성공")
				location.href="/board/list"
			}
		},
		error:function(e){
			alert("삭제실패 : "+e)
		}
	})//ajax
})//btnDelete

init();
</script>



