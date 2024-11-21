<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Q&A 게시판</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link href="${pageContext.request.contextPath}/resources/css/boardStyle.css"
		  rel="stylesheet">
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<section class="py-5">
		<%@ include file="include/boardNav.jsp"%>
		<!--	<form action="/catdog/noticeRegister" method="get">-->
				<div id="wrap">
					<h2>공지사항</h2>
						<table class="notice-table">
							<tr>
								<th>NO</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td>${board.board_no}</td>
									<td><a href="boardDetail?board_no=${board.board_no}"> ${board.board_title} </a></td>
									<td>${board.board_date}</td>
									<td>${board.board_readcnt}</td>
								</tr>
							</c:forEach>
						</table>
						
					${board.board_title}
						

					<!-- 
					<div class="paging">
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
					 -->
				
					<div class="qnaRegister-box">
						<button type="submit" class="qnaRegister-button">글 작성</button> <!-- 작성버튼 여기에 넣을지 말지 고민 -->
					</div>
					
					</div>
			<!-- </form>  -->
			
			
							
	</section>
	
	

</body>
</html>

