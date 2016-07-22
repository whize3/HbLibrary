<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/HbLib/css/mylibrary.css">
<script type="text/javascript" src="/HbLib/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
function modify_go(f) {
	f.action="/HbLib/Controller?type=qnamodify";
	f.submit();
}
$(function() {
	$(".navileft>li").addClass("navileft_li")
	$("#navi_02").css("background-color", "gray")
});	
</script>
</head>
<body>
<jsp:useBean id="qna" class="com.hb.mybatis.QnaVO"/>
<jsp:setProperty property="*" name="qna"/>
<jsp:include page="../header.jsp" />
	<div class="mainArea">
		<div class="mainArea2">
			<jsp:include page="board_navi.jsp" />
			<div id="mainview">
				<div class="mainviewnavi">◆게시판> QNA</div>
				<div>
					<div align="center">
						<form method="post">
							<table width="300">
								<tbody>
									<tr>
										<th bgcolor="#B2EBF4">번호</th>
										<td ><input type="hidden" name="q_idx" value="${qna.q_idx}">${qna.q_idx}</td>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">제목</th>
										<td ><input type="text" name="qa_subject" value="${qna.qa_subject}"></td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">첨부파일</th>
									</tr>

									<tr>
										<th bgcolor="#B2EBF4">날짜</th>
										<td><input type="hidden" name="qa_date" value="${qna.qa_date}">${qna.qa_date}</td>
									</tr>
									<tr>
										<th bgcolor="#B2EBF4">내용</th>
									</tr>
									<tr>
										<td colspan="2"><textarea rows="8" cols="50" name="qa_content">${qna.qa_content}</textarea></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2"><input type="button" value="목록"
											onclick="javascript:location.href='/HbLib/Controller?type=qnalist'" /> 
											<input type="button" value="수정"
											onclick="modify_go(this.form)" /> </td>
									</tr>
								</tfoot>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>