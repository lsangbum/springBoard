<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>list</title>
	</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		let chkBoxCtn;
		init();
		
		function init(){
			chkBoxCtn = $j('#listCheck input[name=boardType]').length;
			$j('#listCheck #all').on('click', function(){
				if($j('#all').prop('checked')){
					$j('input[type=checkbox]').prop('checked', true);// ��ü��ư�� ���õ� ��� checkbox��ü����
				}else {
					$j('input[type=checkbox]').prop('checked', false);// ��ü��ư�� ������ ��� checkbox��ü����
				}
			});//��ü����
			
			$j('input[name=boardType]').on('click', function(){//��μ��ý� ��ü��ư Ȱ�� ����ϳ� ���Ž� ��ü����
				if($j('#all').prop('checked')){
					$j('input[name=all]').prop('checked', false);
				}else if($j('input[name=boardType]:checked').length == chkBoxCtn){
					$j('input[name=all]').prop('checked', true);
				}
			});
			//�Խñ�Ÿ�� ajaxó��
			$j("#boardTypeCheck").on("click",function(){
				var ctnBox = $j('input[name=boardType]:checked').serialize();
				var pageNo = ${pageNo};
				$j.ajax({
	 			    url : "/board/boardList.do",
				    dataType: "HTML",
				    type: "GET",
				    data : ctnBox,
				    success: function(data, textStatus, jqXHR)
				    {
				    	$j('body table').remove();
				    	$j('body').html(data);
				    	init();
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("����");
				    }
				});
			});
		}//init()
	});//ready
</script>
	<body>
		<table align="center">
			<tr>
				<td class="tableTop" >
					<a href="/member/memberLogin.do">login</a>
					<a href="/member/memberJoin.do">join</a>	
					total : ${totalCnt}
				</td>
			</tr>
			<tr>
				<td>
					<table id="boardTable" border = "1">
						<tr>
							<td width="80" align="center">
								Type
							</td>
							<td width="40" align="center">
								No
							</td>
							<td width="300" align="center">
								Title
							</td>
						</tr>
						
						<c:forEach items="${boardList}" var="list">
							<tr id="boardLists">
								<td align="center">
									${list.codeName}
								</td>
								<td>
									${list.boardNum}
								</td>
								<td>
									<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
								</td><!-- ������ ���ı� rownum�� �̾Ƽ� �����ֱ� vo�� prevNum nextNum �߰� -->
							</tr>	
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<a href ="/board/boardWrite.do?pageNo=${pageNo}">�۾���</a>
				</td>
			</tr>
			<tr>
				<td id="listCheck" align="left">
					<input type="checkbox" id="all" name="all" value="all"><label for="all">��ü</label>
						<c:forEach items="${comCodeList}" var="ctnList" end="3">
							<input type="checkbox" id="${ctnList.codeID }" name="boardType" value="${ctnList.codeID }">
							<label for="${ctnList.codeID }">${ctnList.codeName }</label>
						</c:forEach>
					<input id="boardTypeCheck" type="submit" value="��ȸ">
				</td>
			</tr>
		</table>	
	</body>
</html>