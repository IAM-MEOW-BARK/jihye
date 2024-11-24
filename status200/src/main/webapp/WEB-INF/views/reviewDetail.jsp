<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<title>공지사항 게시글</title>
	<link href="${pageContext.request.contextPath}/resources/css/boardStyle.css" rel="stylesheet">
</head>
<body>
<%@ include file="include/header.jsp"%>
	<section class="py-5">
       	<%@ include file="include/board_nav.jsp"%>
		   		 <div class="reviewDetail-table">
		   		 	<table border="1">
		   		 		<tbody>
		   		 			<tr>
		   		 				<td>${reviewDetail.review_score}</td>
		   		 				<td>${reviewDetail.review_img}</td>
		   		 				<td>${reviewDetail.review_content}</td>
		   		 				<td>${reviewDetail.user_id}</td>
		   		 				<td>${reviewDetail.review_date}</td>
		   		 				<td>${reviewDetail.review_readcnt}</td>
		  		 			</tr>
		   		 		</tbody>
		   		 	</table>
		   		 </div>
		   		 
			<form action="reviewList" method="get">
		   		 <div class="allView-box">
						<button type="submit" class="allView-button">전체보기</button>
		         </div>
         </form>
 	</section>
</body>
</html>