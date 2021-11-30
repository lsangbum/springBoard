<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!-- ����κи� �ٲٱ�-->
<table align="center">
	<tr>
		<td align="right">
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
<!-- ����κи� �ٲٱ�-->
