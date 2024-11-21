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
	<section class="py-5">
       	 <%@ include file="include/boardNav.jsp"%>
		   		 <div class="noticeDetail-table">
		   		 	<table border="1">
		   		 		<tbody>
		   		 			<tr>
		   		 				<th scope="row">제목</th>
		   		 				<td>${board.board_title}</td>
		  		 			</tr>
		  		 			<tr>
		  		 				<td colspan="2" class="noticeDetail-bon">
		  		 					<div class="detail">
		  		 						<p>${board.board_content}</p>
		  		 					</div>
		  		 				</td>
		   		 				
		  		 			</tr>
		   		 		</tbody>
		   		 	</table>
		   		 </div>
			<form action="boardList" method="get">
		   		 <div class="allView-box">
						<button type="submit" class="allView-button">전체보기</button>
		         </div>
	         </form>
  		 </section>
</body>
</html>