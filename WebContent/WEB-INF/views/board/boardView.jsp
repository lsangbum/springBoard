<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
<script type="text/javascript">
	$j(document).ready(function(){
		$j("#boardDelete").on("click",function(){
			  if (confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
					// 확인(예) 버튼 클릭 시 이벤트
					location.href="/board/boardDelete.do?boardType=${board.boardType}&boardNum=${board.boardNum}&pageNo=${page.pageNo}";
			    } else {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			        history.back();
			    }
		});
	});
</script>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do?pageNo=${page.pageNo}"><button>List</button></a>
			<a href="/board/boardUpdate.do?boardType=${board.boardType}&boardNum=${board.boardNum}&pageNo=${page.pageNo}"><button>Update</button></a>
			<input id="boardDelete" type="button" value="Delete">
			<%-- <a href="/board/boardDelete.do?boardType=${board.boardType}&boardNum=${board.boardNum}&pageNo=${page.pageNo}">Delete</a> --%>
		</td>
	</tr>
</table>	
</body>
</html>