<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>SpringDataJPA Board</h1> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-5">
<div class="container">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="/board/list">HOME</a>
  
  <!-- Links -->
  <ul class="navbar-nav mr-auto">
    	<li class="nav-item"><a class="nav-link" href="/board/insert">글쓰기</a></li>
    	<li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
    	<li class="nav-item"><a class="nav-link" href="/file/insert">파일올리기</a></li>
					<li class="nav-item"><a class="nav-link"href="/file/list">파일목록</a></li>
					
					<li class="nav-item"><a class="nav-link"href="/file2/insert">(properties)Fileinsert22</a></li>
					<li class="nav-item"><a class="nav-link"href="/file2/list">Filelist22</a></li>

  </ul>
		<ul class="navbar-nav">
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
					
					<li class="nav-item"><a class="nav-link"href="/register">회원가입</a></li>
					
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link"
						href="/userUpdate">회원변경</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/logout">로그아웃(<sec:authentication property="principal.user.username" />)</a></li>
				</sec:authorize>
		</ul>
  
  </div>
</nav>


