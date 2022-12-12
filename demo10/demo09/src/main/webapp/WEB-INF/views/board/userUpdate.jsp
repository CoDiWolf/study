<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">

	<form action="/userUpdate" method="post">
	     <div class="form-group">
				<label for="username">아이디:</label> <input type="text"
					class="form-control" id="username" value="${principal.user.username }"
					name="username" readonly="readonly">
			</div>
			
		<div class="form-group">
			<label for="password">비밀번호:</label> <input type="password"
				class="form-control" id="password" value="${principal.user.password }" name="password">
		</div>
		
	<%-- <div class="form-group">
			<label for="pass_check">비밀번호 확인:</label> 
			<input type="password" class="form-control" id="pass_check" placeholder="Enter pass_check"
				name="pass_check">
		</div> 

		<div class="form-group">
			<label for="name">이름:</label> <input type="text" id="name"
				name="name" class="form-control" value="${sMember.name }">
		</div> --%>

		<div class="form-group">
			<label for="email">주소:</label> <input type="text" id="email"
				name="email" class="form-control" value="${principal.user.email }">
		</div>
		<button type="button" class="btn btn-secondary" id="btnUpdate">회원수정</button>
	</form>
	<script>
	$("#btnUpdate").click(function(){
		   //유효성검사
		if($("#password").val()==""){
			alert("비밀번호를 입력하세요");
			$("#password").focus();
			return false;
		}
		/* if($("#pass").val()!=$("#pass_check").val()){
			alert("비번이 맞지 않습니다.");
			$("#pass_check").focus();
			return false;
		}
		if($("#name").val()==""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		} */
		if($("#email").val()==""){
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		  data = {
				  "username" : $("#username").val(),
				  "password" : $("#password").val(),
				  "email" : $("#email").val()
		  } 
			$.ajax({  //post  join
				type:"put",
				url :"/user/update",
				contentType: "application/json;charset=utf-8",
				data: JSON.stringify(data)
			})
			.done(function(resp){
					if(resp=="success"){
						alert("회원변경 성공")
						location.href="/user/login";
					}
			})
			. fail(function(e){
					alert("회원변경실패")
			}) //ajax
				
	}) //btnJoin
	
	
	</script>
</div>