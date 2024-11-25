<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
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
            border-collapse: collapse; /* 테두리를 하나로 합침 */
            margin-bottom: 20px;
            table-layout: fixed;
        }
        table th, table td {
            border-top: 1px solid #ccc; /* 위쪽 줄만 추가 */
            border-bottom: 1px solid #ccc; /* 아래쪽 줄만 추가 */
            padding: 10px;
            text-align: center;
            font-size: 13px;
        }
        table th {
            background-color: #feebe1;
            font-weight: bold;
        }
		table th:nth-child(1), table td:nth-child(1),
		table th:nth-child(5), table td:nth-child(5) { 
		    width: 10%; 
		}
		table th:nth-child(2), table td:nth-child(2) { 
		    width: 50%;
		    white-space: nowrap;
		    overflow: hidden; 
		    text-overflow: ellipsis; 
		    text-align: left;
		}
		table th:nth-child(2) {
			text-align: center;
			}
		
		table th:nth-child(3), table td:nth-child(3),
		table th:nth-child(4), table td:nth-child(4) { 
		    width: 15%;
		}
		a {
			text-decoration: none; /* 공통적으로 필요한 경우 */
	        color: inherit;
		}
		.pagination-container {
            display: flex;
            justify-content: space-between; /* 양쪽 정렬 */
            align-items: center; /* 세로 정렬 */
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
        .write_button {
         	padding: 8px 17px;
         	margin-right: 10px;
            cursor: pointer;
            font-size: 11px;
            border: 1px solid #ff6600;
            border-radius: 4px;
            background-color: #ffffff;
            color: #ff6600;
            
        }
         .write_button:hover {
            background-color: #ff6600;
            color: #ffffff;
        }  
    </style>
</head>
<body>
	<%@ include file="include/board_nav.jsp"%>
    <div class="container">
        <!-- 공지글 리스트 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>답변상태</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach var="qna" items="${qnaList}">
					<tr>
						<td>${qna.qna_no}</td>
						<td><a href="qnaDetail?qna_no=${qna.qna_no}"> ${qna.qna_content} </a></td>
						<td>${qna.user_id}</td>
						<td>${qna.qna_date}</td>
						<td class=qna-reply>${qna.qna_reply}</td>
					</tr>
				</c:forEach>
            </tbody>
        </table>
        
		<!-- 페이징 처리와 글쓰기 버튼 -->
        <div class="pagination-container">
            <!-- 페이징 처리 -->
            <div class="pagination">
                <c:if test="${startPage > 1}">
                    <a href="qnaList?pageNum=${startPage - 1}&pageListNum=${pageListNum-1}">&lt;</a>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="page">
                    <a href="qnaList?pageNum=${page}&pageListNum=${pageListNum}" 
                       class="${currentPage == page ? 'active' : ''}">${page}</a>
                </c:forEach>
                <c:if test="${endPage  < totalPage}">
                    <a href="qnaList?pageNum=${endPage + 1}&pageListNum=${pageListNum+1}">&gt;</a>
                </c:if>
            </div>
            
            <!-- 글쓰기 버튼 -->
            <a class="write_button" href="qnaRegister">글쓰기</a>
        </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        // 모든 qna-reply 셀을 가져옵니다.
        const replyCells = document.querySelectorAll("td.qna-reply");

        replyCells.forEach(cell => {
            if (!cell.textContent.trim()) {
                // 내용이 비어 있으면 셀 비우기
                cell.textContent = ""; 
            } else {
                // 내용이 있으면 "답변완료" 표시
                cell.textContent = "답변완료";
            }
        });
    });
</script>
</body>
</html>