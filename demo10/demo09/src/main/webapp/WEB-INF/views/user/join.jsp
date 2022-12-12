<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<form action="join" method="post">
<div class="container">

이름:<input type="text" name="username" id="username"/><br>
비밀번호:<input type="password" name="password" id="password"/><br>
이메일:<input type="text" name="email" id="email"/><br>


<button type="button" id="btnJoin">회원가입</button>

<script>
$("#btnJoin").click(function(){
	var dataParam = {
			"username" : $("#username").val(),
			"password" : $("#password").val(),
			"email" : $("#email").val()
		}
	$.ajax({
		type:"POST",
		url : "/register",
		data : JSON.stringify(dataParam),
		contentType : "application/json;charset=utf-8"
	})
	.done(function(resp){
		if(resp=="success"){
		alert("회원가입성공")
		location.href="/login"
		}
		else if(resp=="fail"){
			$("#idcheck").html("<b>아이디 중복 확인<b>")
			$("#id").val("");
		}
	})
	.fail(function(){
		alert("회원가입실패")
	})
})
</script>

</div>
</form>
</body>
</html>