<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 회원 가입</title>
<c:forEach var="arrayList" items="${arrayList}">
<c:if test="${arrayList.id==id}">
<script type="text/javascript">
alert("입력하신 ${id} 아이디가 존재합니다. 다시 입력해주세요.");
location.href="./MemberNewInsertm.do";
</script>
</c:if>
</c:forEach>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min_4.5.0.css">
<script src="../js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min_4.5.0.js" type="text/javascript"></script>

</head>
<body>
<div class="container p-3 my-3 border">
<script type="text/javascript">
alert("입력하신 ${id} 아이디가 회원 등록 되었습니다.")
location.href="./MemberLoginm.do"
</script>
</div>

</body>
</html>