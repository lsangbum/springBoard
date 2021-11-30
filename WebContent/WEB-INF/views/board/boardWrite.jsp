<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">
	
		
	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();			
			var pageNo = ${pageNo};
			
			$j.ajax({
 			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�޼���:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=" + pageNo;
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
		});
		/* ���߰� */
		var cnt = 1;/* �� �±׺� �������ο� */
		$j("#rowAdd").on("click",function(){
			
			var tBodyObj = $j('#boardWriteTable > tbody');
			var tBodyCnt = $j('#boardWriteTable > tbody').length;
			
			var innerHtml ="";
			innerHtml += '<tbody><tr><td width="120" align="center">Type</td>'
			innerHtml += '<td width="400"><select name="boardVoList['+ cnt +'].boardType"><option value="a01" selected>�Ϲ�</option>'
			innerHtml += '<option value="a02">Q&A</option><option value="a03">�͸�</option>'
			innerHtml += '<option value="a04">����</option>	</select></td></tr>'
			innerHtml += '<tr><td width="120" align="center">'
			innerHtml += '<input type="checkbox" id="" name="" >Title</td>'
			innerHtml += '<td width="400"><input name="boardVoList['+ cnt +'].boardTitle" id="boardTitle" type="text" size="50">'
			innerHtml += '</td></tr>'
			innerHtml += '<tr><td height="300" align="center">Comment'
			innerHtml += '</td><td valign="top">'
			innerHtml += '<textarea name="boardVoList['+ cnt +'].boardComment" id="boardComment" rows="20" cols="55"></textarea>'
			innerHtml += '</td></tbody>'
			
			cnt++;
			tBodyObj.eq(tBodyCnt - 2).after(innerHtml);
		});
		/* ����� */
		$j("#rowDel").on("click",function(){
			var tBodyObj = $j('#boardWriteTable > tbody');
			var tBodyCnt = $j('#boardWriteTable > tbody').length;
			
			if(tBodyCnt > 2){
				if($j('#boardWriteTable input[type="checkbox"]:checked').length > 0){
					$j('#boardWriteTable input[type="checkbox"]:checked').parent().parent().parent().remove();
				}else{
					tBodyObj.eq(tBodyCnt-2).remove();
				}
			}else {
				alert("�Խñ��� 1�� �̻� �����ؾ��մϴ�.");
			}//else
				
			
		});
		
	});
	

</script>
<body>
<form class="boardWrite">
	<table align="center">
		<tr>
			<td align="right">
				<input id="submit" type="button" value="�ۼ�">
				<input id="rowAdd" type="button" value="�߰�">
				<input id="rowDel" type="button" value="����">
			</td>
		</tr>
		<tr>
			<td>
				<table id="boardWriteTable" border ="1">
						<tbody>
							<tr>
								<td width="120" align="center">
									Type
								</td>
								<td width="400">
									<select name="boardVoList[0].boardType">
										<c:forEach items="${comCodeList}" var="ctnList" end="3">
											<c:choose>
												<c:when test="${ctnList.codeID eq 'a04'}">
													<option value="${ctnList.codeID }" selected>${ctnList.codeName }</option>
												</c:when>
												<c:otherwise>
													<option value="${ctnList.codeID }">${ctnList.codeName }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select> 
								</td>
							</tr>
							<tr>
								<td width="120" align="center">
									<input type="checkbox" value="1">Title
								</td>
								<td width="400">
									<input name="boardVoList[0].boardTitle" id="boardTitle" type="text" size="50"> 
								</td>
							</tr>
							<tr>
								<td height="300" align="center">
								Comment
								</td>
								<td valign="top">
									<textarea name="boardVoList[0].boardComment" id="boardComment" rows="20" cols="55"></textarea>
								</td>
							</tr>
						</tbody>
					
					<!-- ��������Ѵ� -->
					<!-- <tr id="boardWriteTbody">
						
					</tr> -->
					<!-- ��������Ѵ� -->
					<tbody>
						<tr>
							<td align="center">
							Writer
							</td>
							<td>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do?pageNo=${pageNo}">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>