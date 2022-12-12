<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<div class="container">
<h2>회원정보</h2>
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>이메일</th>
        <th>패스워드</th>
        <th>등급</th>
        <th>닉네임</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${tbl_user6 }" var="user" varStatus="st">
    	<tr>
    		<td>${user.user.id }</td>
    		<td>${user.user.email }</td>		
    		
    		 <td>${user.user.password }</td> 
    		<td>${user.user.username }</td>
    	</tr>
    </c:forEach>
    </tbody>
  </table>
  
  <div class="d-flex justify-content-between mt-5 mr-auto">
  	<ul class="pagination">
  		<c:if test="${user.first==false }">
  			<li class="page-item"><a class="page-link" href="?page=${user.number-1 }&field=${param.field }&word=${param.word }">이전</a></li>
  		</c:if>
  		<c:if test="${user.last==false }">
  			<li class="page-item"><a class="page-link" href="?page=${user.number+1 }&field=${param.field }&word=${param.word }">다음</a></li>
  		</c:if>
  	</ul>
  	<div>
  		<form class="form-inline" action="/board/list" method="get">
  			<select name="field" class="form-control mr-sm-1">
  				<option value="title">제목</option>
  				<option value="content">내용</option>
  			</select>
  			<input type="text" name="word" class="form-control" placeholder="Search">
  			<button class="btn btn-secondary">Search</button>  		
  		</form>  	  	
  	</div>  	
  </div>
  
</div>