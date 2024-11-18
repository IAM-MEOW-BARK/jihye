<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자주묻는질문</title>
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


		<nav class="middlemenu">
			<ul class="nav justify-content-center">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="#">전체</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">회원서비스</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">배송</a>
			  </li>
			   <li class="nav-item">
			    <a class="nav-link" href="#">주문/결제</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">반품/교환/취소</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">기타</a>
			  </li>
			</ul>
		</nav>




		<div id="wrap">
			
       		<table class="ask-table">
            	<tr>
               		<th>NO</th>
              		<th>구분</th>
					<th>내용</th>
            	</tr>
           
	            <tr>
	                <td>1</td>
	                <td>회원서비스</td>
	                <td><a href="#" class="title" onclick="toggleContent(this); return false;">제목</a></td>
	            </tr>
            
      
				<tr class="content">
               		 <td colspan="3">내용 어쩌구</td>
           		</tr>
            
	            <tr>
	                <td>2</td>
					<td>배송</td>
                	<td><a href="#" class="title" onclick="toggleContent(this); return false;">제목</a></td>
           		 </tr>
	             <tr class="content">
	                <td colspan="3">내용</td>
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
		
		
			</div>
	

	</section>
	
	
	<script src="/js/summernote/lang/boardScript.js"></script>
</body>
</html>

