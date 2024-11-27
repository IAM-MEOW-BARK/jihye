<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>공지사항 게시글</title>
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
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 13px;
        }

        table th {
            background-color: #feebe1;
            font-weight: bold;
            text-align: center;
            width: 5%;
        }

        table td {
        	padding-left: 20px;
            white-space: normal; /* 줄바꿈 허용 */
            word-wrap: break-word; /* 긴 텍스트 자동 줄바꿈 */
            line-height: 1.6; /* 텍스트 줄 간격 */
            text-align: left;
        }
        
		 /* 특정 셀 스타일 */
        .content-cell {
            height: 500px; /* 원하는 높이 */
            
        }
		.reply-label {
            display: inline-block;
            padding: 5px 10px;;
            background-color: #ff6600;
            color: white;
            border-radius: 4px;
            margin: 10px 5px;
            font-size: 11px;
        }
        .reply-content {
            margin-top: 5px;
            color: #333;
        }
        /* 버튼 스타일 */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .qnaList, .qnaUpdate, .qnaDelete {
            padding: 8px 17px;
            border: 1px solid #ff6600;
            background-color: #ffffff;
            border-radius: 4px;
            color: #ff6600;
            cursor: pointer;
            text-decoration: none;
            font-size: 11px;
        }

        .qnaList:hover, .qnaUpdate:hover, .qnaDelete:hover {
            background-color: #ff6600;
            color: #ffffff;
            
        }
    </style>
</head>
<body>
	<%@ include file="include/board_nav.jsp"%>

    <div class="container">
        <!-- Q&A 상세 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>상품명</th>
                    <td>${qnaDetail.product_name}</td>
                </tr>
            </thead>
            <tbody>
             	<tr>
                    <th>작성자</th>
                    <td>${qnaDetail.user_id}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${qnaDetail.qna_date}</td>
                </tr>
                <tr class="content-cell">
                    <th>내용</th>
                    <td>${qnaDetail.qna_content}
                    	 <!-- 답변 표시 (조건부) -->
                        <c:if test="${qnaDetail.qna_reply != null && !qnaDetail.qna_reply.isEmpty()}">
                            <div class="reply-container">
                                <span class="reply-arrow">↳</span>
                                <span class="reply-label">답변</span>
                                <span class="reply-content">${qnaDetail.qna_reply}</span>
                            </div>
                        </c:if>
                    
                    </td>
                </tr>
              <!--  
              	<tr>
                    <th>답변</th>
                    <td>${qnaDetail.qna_reply}</td>
                </tr>
               -->   
            </tbody>
        </table>

        <!-- 전체보기 버튼 -->
        <div class="button-container">
            <a href="qnaList" class="qnaList">목록</a>
            <a href="qnaUpdate?qna_no=${qnaDetail.qna_no}" class="qnaUpdate">수정</a>
            <a href="qnaDelete?qna_no=${qnaDetail.qna_no}" class="qnaDelete">삭제</a>
            <a href="qnaReply?qna_no=${qnaDetail.qna_no}" class="qnaReply">답</a>
        </div>
    </div>
</body>
</html>