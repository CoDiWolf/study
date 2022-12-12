<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

        <div class="container">
       <h3>JOIN</h3>
       
    <!-- <div class="form-group">
      <label for="userid">UserID:</label>
      <input type="text" class="form-control" id="userid" placeholder="Enter userid" name="userid">
    </div> -->
    
     <!-- <div class="row">
    	<div class="col">
     		<label for="id">아이디:</label>
      		<input type="text" class="form-control" id="id" placeholder="Enter Userid" name="id" >
    	</div>
   	 	<div class="col align-self-end">
    		 <button type="button" id="idCheckBtn" class="btn btn-primary">중복확인</button>
    		<span id="idcheck"></span>
    	</div>
  	</div>
  	<br/> -->
  	
  	 <div class="form-group">
      <label for="username">아이디:</label>
      <input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
    </div>
    
    <div class="form-group">
      <label for="password">비밀번호:</label>
      <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
    </div>
    
    <!-- <div class="form-group">
      <label for="pass_check">비밀번호 확인:</label>
      <input type="password" class="form-control" id="pass_check" placeholder="Enter pass_check" name="pass_check">
    </div>
    
  <div class="form-group">
      <label for="username">이름:</label>
      <input type="text" class="form-control" id="username" placeholder="Enter name" name="username">
    </div> -->
    
   <div class="form-group">
      <label for="email">이메일:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
<br/>

    <button class="btn btn-info" id="btnJoin">회원가입</button>

  
  <script>
  $("#btnJoin").click(function(){
	  //유효성검사
	  if($("#username").val()==""){
		  alert("아이디를 입력하세요.")
		  $("#username").focus();
		  return false;
	  }
	  if($("#password").val()==""){
		  alert("비밀번호를 입력하세요.")
		  $("#password").focus();
		  return false;
	  }
	  if($("#email").val()==""){
		  alert("이메일를 입력하세요.")
		  $("#email").focus();
		  return false;
	  }
	  dataParam={
			  "username":$("#username").val(),
			  "password":$("#password").val(),
			  "email":$("#email").val(),
	  }
	  $.ajax({
		  type:'POST',
		  url:'/register',
		  contentType:'application/json;charset=utf-8',
		  data:JSON.stringify(dataParam)	  
	  })//ajax
	  	.done(function(resp){
	  		if(resp=="success"){
	  			alert("회원가입성공")
	  			location.href="login"
	  		}else if(resp=="fail"){
	  			alert("아이디 중복")
	  			$("#username").val("")
	  		}		  
	  })
	  	.fail(function(){
		  alert("회원가입실패")
	  })
  })//btnJoin
  
  </script> 
  
</div>
    