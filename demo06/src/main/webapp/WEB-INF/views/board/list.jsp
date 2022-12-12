<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<meta charset="UTF-8">
<title>Insert title here</title>
<div class="container">
<h2>게시판(${count })</h2>
  <table class="table">
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
    <c:forEach items="${barr.content }" var="board" varStatus="st">
    	<tr>
    		<td>${board.num }</td>
    		<td><a href="/board/view/${board.num}">${board.title }[${board.replyCnt }]</a></td>
    		<td>${board.user.username }</td>		
    		<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></td>
    		<%-- <td>${board.regdate }</td> --%>
    		<td>${board.hitcount }</td>
    	</tr>
    </c:forEach>
    </tbody>
  </table>
  
  <div class="d-flex justify-content-between mt-5 mr-auto">
  	<ul class="pagination">
  		<c:if test="${barr.first==false }">
  			<li class="page-item"><a class="page-link" href="?page=${barr.number-1 }&field=${param.field }&word=${param.word }">이전</a></li>
  		</c:if>
  		<c:if test="${barr.last==false }">
  			<li class="page-item"><a class="page-link" href="?page=${barr.number+1 }&field=${param.field }&word=${param.word }">다음</a></li>
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