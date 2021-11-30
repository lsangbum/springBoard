<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var result = ${result};
		var pageNo = ${page.pageNo};
		if(result == 0)
			alert("삭제된 글이 없습니다.");
		else if(result > 0)
			alert(${boardNum} +"이 삭제되었습니다.");
		location.href="/board/boardList.do?pageNo=" + pageNo;		
	</script>
</body>
</html>