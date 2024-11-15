<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" type="text/css" href="test.css">
</head>
<body>

	
	<div class="wrapper"> <!-- container 차이가 뭐지 -->
	<!--  %@include file="include/header.jsp"  -->
	
		<nav class="topmenu">
	        <ul class="nav">
	            <li><a href="noticeList.jsp" class="notice"> 공지사항 </a></li>
	            <li><a href="review.jsp" class="review"> 리뷰게시판 </a></li>
	            <li><a href="qna.jsp" class="qna"> Q/A </a></li>
	            <li><a href="" class="ask"> 자주묻는질문 </a></li>
	        </ul>
	    </nav>

		<table class="notice-table">
	        <thead>
	        <tr>
	            <th>No</th>
	            <th>제목</th>
	            <th>등록일</th>
	            <th>조회수</th>
	        </tr>
	        </thead>
	        <tbody>
        		<c:forEach var="board" items="${list }">
				 	<tr>
				 	<td>${board.board_no}</td>
				 	<td><a href="detail?bno=${board.board_no}"> ${board.board_title} </a></td>
				 	<td>${board.board_date}</td>
				 	<td><span class="badge">${board.board_readcnt}</span></td>
				 	</tr>
				</c:forEach>

        
	        </tbody>
        </table>
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