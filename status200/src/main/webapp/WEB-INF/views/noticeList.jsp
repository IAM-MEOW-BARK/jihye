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

	<!-- Product section-->
	<section class="py-5">

		<nav class="topmenu">
			<ul class="nav">
				<li><a href="noticeList.jsp" class="notice"> 공지사항 </a></li>
				<li><a href="review.jsp" class="review"> 리뷰게시판 </a></li>
				<li><a href="qna.jsp" class="qna"> Q/A </a></li>
				<li><a href="ask.jsp" class="ask"> 자주묻는질문 </a></li>
			</ul>
		</nav>


		<div id="wrap">
			<h2>공지사항</h2>
			
			<table class="notice-table">
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				
				<tr>
					<td>1</td>
					<td><a href="detail?bno=${qna.no}"> 제목 </a></td>
					<td>2024/11/14</td>
					<td><span class="badge">10</span></td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="detail?bno=${qna.no}"> 제목 </a></td>
					<td>2024/11/14</td>
					<td><span class="badge">10</span></td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="detail?bno=${qna.no}"> 제목 </a></td>
					<td>2024/11/14</td>
					<td><span class="badge">10</span></td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="detail?bno=${qna.no}"> 제목 </a></td>
					<td>2024/11/14</td>
					<td><span class="badge">10</span></td>
				</tr>
				
			</table>
		
		
		
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
		
		
			<div class="qnaRegister-box">
				<button type="button" class="qnaRegister-button" onclick = "location.href='qnaRegister.jsp'">글 작성</button>
			</div>
			
			</div>
	

	</section>
	
	

</body>
</html>
