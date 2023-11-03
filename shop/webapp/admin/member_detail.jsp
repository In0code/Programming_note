<%@page import="java.sql.SQLException"%>
<%@page import="admin.vo.ClientInfoVO"%>
<%@page import="admin.dao.ClientInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="관리자 회원 상세정보 보기"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  if(request.getParameter("md") == null){
		response.sendRedirect("member_list.jsp");
	}  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../cdn/admin_cdn.jsp"/>
<style type="text/css">
body{
 margin: 0px;
}
#wrap{
	
}
#right{
	width: calc(100vw - 240px); height: 100%;float: right;
	background: blue;
}
#left{
	min-width: 240px;height: 100%;float: left;
	padding: 0px;
	background: yellow;
}
#rightHeader{
	min-height: 55px;
	padding-top: 8px;padding-bottom: 5px;
	padding-right: 15px;
	background: #FFFFFF;
}
#rightBody{
	width: 100%; min-height: 500px;float: right;
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

#mainTitle{
	font-size:25px;
	color: #333;
	position: absolute;
	left : 60px;
} 
#background_box{
overflow: auto;
background-color:  #FFFFFF;
color:  #333333;
height: 150%; width: 80%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}
/* 승우 테이블 */
table.m_list {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: none;
  margin : 20px 10px;
  margin-top:-355px;
}
table.m_list th {
  width: 175px;
  padding: 22px;
  font-size:16px;
  font-weight: 800;
  vertical-align: top;
  border-bottom: none;
}
table.m_list td {
  width: 350px;
  padding: 22px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
input:focus {outline:none;}

#delbtn{
margin-left:857px; 
margin-top:-60px;
background-color:#939393;
color: #fff;
border:none;
width:130px
}
#background_box img {
  width: 450px;
  margin-left:540px;
  margin-top:-80px
}


</style>
<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});//click
});//ready

function memberDelete( id ) {
	if(confirm("이 회원을 탈퇴처리 하시겠습니까?")){
		$.ajax({
			url: "member_delete.jsp",
			type: "get",
			data: "id="+id,
			dataType:"json",
			error: function( xhr ){
				alert("서버에서 문제가 발생하였습니다.<br>잠시 후에 다시 시도해주세요");
				location.href="member_list.jsp";
			},
			success: function( jsonObj ){
				if( jsonObj.result ){
					alert("탈퇴 처리 되었습니다.")
				}else{
					alert("서버에서 문제가 발생하였습니다.<br>잠시 후에 다시 시도해주세요");
				}
				location.href="member_list.jsp";
			}//success
		
		});//ajax
		
	}//end if
}//memberDelete
</script>
</head>
<body>
<%
	ClientInfoDAO ciDAO= ClientInfoDAO.getInstance();
try{
	String id=request.getParameter("md");
	ClientInfoVO ciVO=ciDAO.selectUser(id);
	pageContext.setAttribute("member", ciVO);
	pageContext.setAttribute("id", id);
	
}catch(SQLException se){
	se.printStackTrace();
}
%>
<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="text" id="mainTitle">
		<a href="member_list.jsp">	
			<img src="../common/images/back.png" style="width:27px;"/>
			<strong>회원 리스트</strong>
		</a>
		
		<form action="member_delete.jsp" id="del" name="del">
		<input type="button" id=delbtn name="delbtn" value="사용자 삭제" class="btn btn-outline-dark" onclick="memberDelete('${ id }')"/>
		</form>
		
		</div>
		<div id="background_box" style="width:60%; height:160%"> <!-- 코딩 -->
		<h6 style="padding:15px 25px; font-weight: bold; font-size:20px; color: navy; ">회원 상세정보</h6>
		<img src="../common/images/default_user.jpg" alt="user_image"/>
	<table class="m_list">
  <tr>
    <th scope="row">이름</th>
    <td><c:out value="${ member.name }"/></td>
  </tr>
   <tr>
    <th scope="row">아이디</th>
    <td><c:out value="${ member.id }"/></td>
  </tr>
  <tr>
    <th scope="row">핸드폰번호</th>
    <td><c:out value="${ member.phone }"/></td>
  </tr>
  <tr>
    <th scope="row">이메일</th>
    <td><c:out value="${ member.email }"/></td>
  </tr>
  <tr>
    <th scope="row">주소</th>
    <td>
    <input type="text" id="zipcode" name="zipcode" value="<c:out value="${ member.zipcode }"/>"  
    readonly="readonly" style="border:none">
    <input type="text" id="addr" name="addr" value="<c:out value="${ member.addr }"/>" 
    readonly="readonly" style="border:none ">
    <input type="text" id="detailAddr" name="detailAddr" value="<c:out value="${ member.detailAddr }"/>" 
    readonly="readonly" style="border:none">
    </td>
    
  </tr>
  
  <tr>
    <th scope="row">가입일</th>
    <td><c:out value="${ member.joinDate }"/></td>
  </tr>
  <tr>
    <th scope="row">등급</th>
    <td><c:out value="${ member.membership }"/></td>
  </tr>
  <tr>
    <th scope="row">총 구매건수</th>
    <td>0</td>
  </tr>
  <tr>
    <th scope="row">총 구매금액</th>
    <td>0</td>
  </tr>
</table>
		</div>
	</div>	
</div>
</body>
</html>

