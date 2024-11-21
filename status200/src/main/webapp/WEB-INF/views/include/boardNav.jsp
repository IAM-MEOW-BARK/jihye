<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>Q&A 게시글 작성</title>

	<link href="${pageContext.request.contextPath}/resources/css/boardStyle.css" rel="stylesheet">
    
</head>
<body>
		<nav class="topmenu">
 			<ul class="nav">
		        <li><a href="boardList" class="notice"> 공지사항 </a></li>
		        <li><a href="reviewList" class="review"> 리뷰게시판 </a></li>
		        <li><a href="qnaList" class="qna"> Q/A </a></li>
		        <li><a href="faqList" class="ask"> 자주묻는질문 </a></li>
		    </ul>
		</nav>
</body>
</html>