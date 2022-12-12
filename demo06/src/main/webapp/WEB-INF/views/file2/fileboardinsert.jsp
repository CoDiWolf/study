<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
<h3>File Board Insert</h3>

<form action="fileInsert" method="post" enctype="multipart/form-data">

        <div class="form-group">
      <label for="title">제목:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
    </div>
    
    <div class="form-group">
      <label for="writer">작성자:</label>
      <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer"  />
    </div>
<div class="form-group">
      <label for="upload">파일:</label>
      <input type="file" class="form-control" id="upload" placeholder="Enter file" name="upload"  />
    </div>
        <div class="form-group">
      <label for="content">내용:</label>
      <textarea class="form-control" rows="5" id="content" name="content"></textarea>
    </div>
    
    <div align="right">
    	<button type="submit" class="btn btn-info">글쓰기</button>
    	<a href="flist"><button type="button" class="btn btn-info">전체보기</button></a>
    	</div>
    	
</form>

</div>