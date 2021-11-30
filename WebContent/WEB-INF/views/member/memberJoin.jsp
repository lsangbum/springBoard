<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>title</title>
		<style type="text/css">
			input {
				width:12em;
				height:1.5em;
			}
			#phoneNum input{
				width:3em;
			  	height:1.5em;
			}
		</style>
	</head>
	<script type="text/javascript">
		$j(document).ready(function(){
			
			$j("#userIdCheck").on("click",function(){
				let userId = $j('#userId').val();
				alert(userId);
				
				$j.ajax({
	 			    url : "/member/memberIdCheck.do",
				    dataType: "JSON",
				    type: "POST",
				    data : userId,
				    success: function(data, textStatus, jqXHR)
				    {
						if(data == userId){
							alert("사용가능한 아이디 입니다.");
						}
						else{
							alert("이미 사용중인 아이디 입니다.");
							$j("#userId").val("");
							$j("#userId").focus();
						}
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    }
				});
			});
		});
	</script>
	<body>
		<table  align="center">
			<tr>
				<td align="left">
					<a href="/board/boardList.do">List</a>
				</td>
			</tr>
			<tr>
				<td>
					<table id="" border = "1">
						<tr>
							<td width="80" align="center">
								id
							</td>
							<td>
								<input type="text" id="userId" name="userId">
								<button id="userIdCheck">중복확인</button>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								pw
							</td>
							<td>
								<input type="password" id="userPw" name="userPw">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								pw check
							</td>
							<td>
								<input type="password" id="userPwCheck" name="userPwCheck">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								name
							</td>
							<td>
								<input type="text" id="userName" name="userName">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								phone
							</td>
							<td id="phoneNum">
								<select id="userPhone1">
									<c:forEach items="${comCodeList }" var="list" begin="4">
										<c:choose>
											<c:when test="${list.codeName eq '010'}">
												<option name="${list.codeName }" selected>${list.codeName }</option>
											</c:when>
											<c:otherwise>
												<option id="" name="${list.codeName }">${list.codeName }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select><span>-</span>
								<input type="text" id="" name=""><span>-</span>
								<input type="text" id="" name="">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								postNo
							</td>
							<td>
								<input type="text" id="userAddr1" name="userAddr1">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								address
							</td>
							<td>
								<input type="text" id="userAddr2" name="userAddr2">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">
								company
							</td>
							<td>
								<input type="text" id="userCompany" name="userCompany">
							</td>
						</tr>
					</table>
				</td>
			</tr>
				<tr>
					<td align="right">
						<a href="/member/memberJoinAction.do">join</a>
					</td>
				</tr>
		</table>	
	</body>
</html>