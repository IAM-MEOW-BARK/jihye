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
       	
       	 <nav class="topmenu">
	        <ul class="nav">
	            <li><a href="noticeList.jsp" class="notice"> 공지사항 </a></li>
	            <li><a href="review.jsp" class="review"> 리뷰게시판 </a></li>
	            <li><a href="qna.jsp" class="qna"> Q/A </a></li>
	            <li><a href="ask.jsp" class="ask"> 자주묻는질문 </a></li>
	        </ul>
   		 </nav>
   		 
   		 
   		 
   		 
   		 
   		 <div class="noticeDetail-table">
   		 	<table border="1">
 
   		 		
   		 		<tbody>
   		 			<tr>
   		 				<th scope="row">제목</th>
   		 				<td>공지사항 제목</td>
  		 			</tr>
  		 			<tr>
  		 				<td colspan="2" class="noticeDetail-bon">
  		 					<div class="detail">
  		 						<p>공지사항 내용내용</p>
  		 					</div>
  		 				</td>
   		 				
  		 			</tr>
   		 		</tbody>
   		 	</table>
   		 </div>
   		 
   		 <div class="allView-box">
				<button type="button" class="allView-button" onclick = "location.href='reviewDetail.jsp'">전체보기</button>
         </div>
  		 </section>
</body>
</html>