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
		   		 <div class="qnaDetail-table">
		   		 	<table border="1">
		   		 		<tbody>
		   		 			<tr>
		   		 		   <!-- <td>${qnaDetail.qna_secret}</td>  -->
		   		 				<td>${qnaDetail.qna_content}</td>
		   		 				<td>${qnaDetail.user_id}</td>
		   		 				<td>${qnaDetail.qna_date}</td>
		   		 				<td> </td>
		  		 			</tr>
		   		 		</tbody>
		   		 	</table>
		   		 </div>
		   		 
			<form action="qnaList" method="get">
		   		 <div class="allView-box">
						<button type="submit" class="allView-button">전체보기</button>
		         </div>
		       </form>	
	 </section>
</body>
</html>