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
       	<%@ include file="include/boardNav.jsp"%>
			<form action="/catdog/reviewList" method="get">
		   		 <div class="reviewDetail-table">
		   		 	<table border="1">
		   		 		<tbody>
		   		 			<tr>
		   		 				<td>★★★★★</td>
		   		 				<td><img src="https://img.dogpre.com/mobile/dogpre/product/101/100326_list_L1_01056064.jpg"></td>
		   		 				<td>판다가 키우고 싶어서 대신 옷을 샀어요!</td>
		   		 				<td>코끼리</td>
		   		 				<td>2024/11/18</td>
		   		 				<td>94</td>
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