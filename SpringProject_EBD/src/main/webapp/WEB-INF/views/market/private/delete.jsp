<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/market/private/delete</title>
</head>
<body>
<!-- 글 삭제 알림 -->
<script>
	alert("게시글이 삭제 되었습니다.");
	location.href="${pageContext.request.contextPath }/market/list.do";
</script>
</body>
</html>