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
			alert("������ ���� �����ϴ�.");
		else if(result > 0)
			alert(${boardNum} +"�� �����Ǿ����ϴ�.");
		location.href="/board/boardList.do?pageNo=" + pageNo;		
	</script>
</body>
</html>