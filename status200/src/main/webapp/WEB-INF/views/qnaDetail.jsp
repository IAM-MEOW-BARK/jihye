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
			<form action="/catdog/qnaList" method="get">
		   		 <div class="qnaDetail-table">
		   		 	<table border="1">
		   		 		<tbody>
		   		 			<tr>
		   		 				
		   		 				<td>코끼리 옷은 안 파나요? 우리집 코끼리 너무 귀여운데..</td>
		   		 				<td>코끼리</td>
		   		 				<td>2024/11/18</td>
		   		 				<td>답변완료</td>
		  		 			</tr>
		   		 		</tbody>
		   		 	</table>
		   		 </div>
		   		 
		   		 <div class="allView-box">
						<button type="button" class="allView-button">전체보기</button>
		         </div>
		       </form>	
	 </section>
</body>
</html>