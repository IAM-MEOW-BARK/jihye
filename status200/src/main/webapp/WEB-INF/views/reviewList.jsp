<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 게시판</title>
    <style>
        /* 전체 레이아웃 */
        body {
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            table-layout: fixed;
        }
        table th, table td {
            border-top: 1px solid #ccc; /* 위쪽 줄만 추가 */
            border-bottom: 1px solid #ccc; /* 아래쪽 줄만 추가 */
            padding: 10px;
            text-align: center;
            font-size: 13px;
            width: 5%; 
        }
        table th {
            background-color: #feebe1;
            font-weight: bold;
        }
        table th:nth-child(2), table th:nth-child(3) {
            background-color: #feebe1; 
            color: transparent; 
            width: 15%; 
        }
		table th:nth-child(3), table td:nth-child(3),
		table th:nth-child(6), table td:nth-child(6) { 
		    width: 5px; 
		}
		table th:nth-child(4), table td:nth-child(4) {
		    width: 30%; 
		    text-align:left;
		}
		a {
			text-decoration: none;
	        color: inherit;
		}   
		.stars {
		 display: inline-block;
            font-size: 14px;
            color: #ffa500; /* 별 색상 */
        } 
		.pagination-container {
            display: flex;
            justify-content: center; 
            align-items: center; 
            margin: 20px 0;
        }
        .pagination {
	        display: flex;
	        gap: 15px; 
	        margin: 0 auto;
	    }
	    .pagination a {
	        text-decoration: none;
	        color: #333;
	        font-size: 12px;
	    }
	    .pagination a.active {
	        color: #ff6600; 
	        font-weight: bold; 
	    }

    </style>
</head>
<body>
	<%@ include file="include/board_nav.jsp"%>
    <div class="container">
        <!-- 리뷰글 리스트 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>별점</th>
                    <th>사진</th>
                    <th>제목/상품</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="review" items="${reviewList}">
						<tr>
							<td>${review.review_no}</td>
							<td>
								<div class="stars">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${i <= review.review_score}">
                                                ★
                                            </c:when>
                                            <c:otherwise>
                                                ☆
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
							</td>
							<td>${review.review_img}</td>
							<td><a href="reviewDetail?review_no=${review.review_no}"> ${review.product_name}</a></td>
							<td>${review.user_id}</td>
							<td>${review.review_date}</td>
							<td>${review.review_readcnt}</td>
						</tr>
				</c:forEach>		
            </tbody>
        </table>
        
		<!-- 페이징 처리와 글쓰기 버튼 -->
        <div class="pagination-container">
            <!-- 페이징 처리 -->
            <div class="pagination">
                <c:if test="${startPage > 1}">
                    <a href="reviewList?pageNum=${startPage - 1}&pageListNum=${pageListNum-1}">&lt;</a>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="page">
                    <a href="reviewList?pageNum=${page}&pageListNum=${pageListNum}" 
                       class="${currentPage == page ? 'active' : ''}">${page}</a>
                </c:forEach>
                <c:if test="${endPage  < totalPage}">
                    <a href="reviewList?pageNum=${endPage + 1}&pageListNum=${pageListNum+1}">&gt;</a>
                </c:if>
            </div>
            
        </div>
    </div>
</body>
</html>