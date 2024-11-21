<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Q&A 게시글 작성</title>
	
	<script src="http://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
	<script src="http://cdn.ckeditor.com/ckeditor5/11.2.0/classic/ckediter.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/boardStyle.css" rel="stylesheet">
    
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<section class="py-5">

	<%@ include file="include/boardNav.jsp"%>
			<form action="/catdog/qnaRegister" method="post">
				<div id="wrap">
					<h2>질문하기</h2>
					<div id="editor">
						<textarea class="register" name="qa_content">내용을 입력하세요.</textarea>
					</div>
				</div>
				
				
				<div class="register-box">
						<button type="submit" class="submit-button">등록</button>
						<button type="reset" class="reset-button">취소</button>
		         </div>
        	</form>
		</section>
		
	<script>
		ClassicEditor
			.create(document.querySelector('#editor'))
			.catch(error => {
				console.errer (errer);
			});
	</script>
	<script src="/js/summernote/lang/qnaScript.js"></script>
	
</body>
</html>