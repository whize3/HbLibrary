<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	$(function() {
		$(".navileft>li").addClass("navileft_li")
		
	});	
</script>
<title>Insert title here</title>
</head>
<body>
 <%

	String b_num = request.getParameter("b_num");
	String b_subject = request.getParameter("b_subject");
	String b_location = request.getParameter("b_location");
	String publisher = request.getParameter("publisher");
	String writer = request.getParameter("writer");
	String category = request.getParameter("category");
	String ISBN = request.getParameter("ISBN");
	String L_url = request.getParameter("L_url");
	System.out.println(L_url);
 
 %>
 		<jsp:include page="../header.jsp" />
 	 	
 	 	<div align="center" id="img" >
 	 		<img src="<%=L_url%>">
 	 	</div>
 	 	
 	 	
 
  
  	  
		
</body>
</html>