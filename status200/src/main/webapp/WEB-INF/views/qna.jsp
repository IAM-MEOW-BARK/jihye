<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
   
    <title>Q&A 게시판</title>
    <link rel="stylesheet" type="text/css" href="test.css">
</head>
<body>
<div class="wrapper">

		<nav class="topmenu">
	        <ul class="nav">
	            <li><a href="#" class="link"> 공지사항 </a></li>
	            <li><a href="#" class="link"> 리뷰게시판 </a></li>
	            <li><a href="#" class="link"> Q/A </a></li>
	            <li><a href="#" class="link"> 자주묻는질문 </a></li>
	        </ul>
	    </nav>
	    
    <table class="qna-table">
        <thead>
        <tr>
            <th>NO</th>
            <th>내용</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>답변상태</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        	<c:forEach var="board" items="${list }">
			 	<tr>
			 	<td>${qna.no}</td>
			 	<td><a href="detail?bno=${qna.no}"> ${qna.content} </a></td>
			 	<td>${user.id}</td>
			 	<td>${qna.date}</td>
			 	<td><span class="badge">${qna.reply}</span></td>
			 	</tr>
			</c:forEach>
				

        </tbody>
    </table>
    <br>
    
<div>
    <button class="write-button">글 작성</button>
    </div>
     <br>
     
        <c:if test="${pageListNUM>1}">
        <a href="list?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> 이전 </a>
        </c:if>
           
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <a href="list?pageListNUM=${pageListNUM }&pageNUM=${i }"> ${i } </a>
        </c:forEach>
        
        <c:if test="${pageListNUM<(totalPage/10)}">
        <a href="list?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> 다음 </a>
        </c:if>

</div>
</body>
</html>
