<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.member.vo.BoardUtilVO"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.BoardRangeVO"%>
<%@page import="kr.co.sist.member.vo.WebMemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="회원리스트" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <c:if test="${ empty sesId }">
    <c:redirect url="login_frm.jsp"/>
    </c:if> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/main/favicon-32x32.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
   $("#btn").click(function(){
	   $("#frm").submit();
   });//click
   
   $("#btnSearch").click(function(){
	   chkNull();
   });//click
   
   $("#keyword").keyup(function(evt){ //keyup은 값을 받을 수 있음
	   if(evt.which == 13){ //enter는 13번
		   chkNull();
	   }//end if
   });//keyup
   
});//ready

function chkNull(){
	var keyword=$("#keyword").val();
	
	if(keyword.trim() == "" ){
		alert("검색 키워드를 입력해주세요.");
		return;
	}//end if
	
	//글자수 제한
	
	//
	
	$("#frmSearch").submit();
	
	
}//chkNull

function memberDetail( id ){

	$("#id").val(id);
	$("#hidFrm").submit();
};

</script>

</head>
<body>
<%
BoardDAO bDAO=BoardDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();

String field=request.getParameter("field");
String keyword=request.getParameter("keyword");
//페이지가 최초 호출시에는 field나 keyword가 없다. 검색을 하지 않는 경우에도 값이 없음
brVO.setField(field);
brVO.setKeyword(keyword);

//1. 총 레코드의 수 -> 검색 키워드에 해당하는 총 레코드의 수
/* int totalCount=bDAO.totalCount(); */
int totalCount=bDAO.totalCount( brVO ); 

//2. 한 화면에 보여줄 게시물의 수
int pageScale=10;
//3. 총 페이지 수
int totalPage=0;

totalPage=(int)Math.ceil(totalCount/pageScale);
//int totalPage=totalCount/pageScale;
//딱 떨어지지 않은 경우 1장 더 추가
//if(totalCount % pageScale != 0){
//   totalPage++;
//}

//현재페이지의 시작번호 구하기
String tempPage=request.getParameter("currentPage");
int currentPage=1;
if(tempPage != null){
   currentPage=Integer.parseInt(tempPage);
}//end if

int startNum=currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);

//끝페이지 번호 구하기
int endNum=startNum+pageScale-1;

//Dynamic Query에 의해서 구해진 시작번호화 끝 번호를 VO에 넣는다
brVO.setStartNum(startNum);
brVO.setEndNum(endNum);

%>
총 레코드의 수 : <%=totalCount %>건<br/>
한 화면에 보여줄 게시물의 수 : <%=pageScale %>건<br/>
총 페이지 수 : <%= totalPage %>장<br/>
현재 페이지 번호 : <%=currentPage %><br/>
시작 번호 : <%=startNum %><br/>
끝 번호 : <%=endNum %><br/>

<%
try{
List<WebMemberVO> list=bDAO.selectMember(brVO);

//관리자 : 1011kiy111 - 권한있음 / 1011kiy222 권한 없음
String id=(String)session.getAttribute("sesId");
if("1".equals(request.getParameter("dataFlag"))){
	if("1011kiy111".equals(id)){
		DataDecrypt dd=new DataDecrypt("a12345678901234567");
		
		for(int i=0; i<list.size(); i++){
			list.get(i).setName(dd.decryption(list.get(i).getName()));
			list.get(i).setCell (dd.decryption(list.get(i).getCell()));
			list.get(i).setEmail(dd.decryption(list.get(i).getEmail()));
		}//end for
		
	}//end if
	if("1011kiy222".equals(id)){
		%>
		<script type="text/javascript">
		alert("해당계정은 권한이 없습니다");
		</script>
		<%
	}//end if
}//end if

pageContext.setAttribute("memberList", list);
}catch(SQLException se){
	se.printStackTrace();
}//end catch
%>

<div>
<form method="post" id="frm">
<input type="button" value="데이터보기" class="btn btn-warning" id="btn"/>
<input type="hidden" name="dataFlag" value="1"/>
</form>
<form action="../day1020/member_detail.jsp" method="post" id="hidFrm">
<input type="hidden" name="id" id="id"/>
</form>
<a href="member_list.jsp?dataFlag=1" class="btn btn-warning">전체보기</a>
<table class="table">
<thead>
<tr>
<th style="width:80px">번호</th>
<th style="width:150px">아이디</th>
<th style="width:150px">이름</th>
<th style="width:120px">생년월일</th>
<th style="width:180px">전화번호</th>
<th style="width:300px">이메일</th>
<th style="width:80px">성별</th>
<th style="width:180px">가입일</th>

</tr>
</thead>
<tbody>

<c:if test="${ empty memberList }">
<tr>
<td colspan="8" style="text-align: center;">회원정보가 존재하지 않습니다</td>
</tr>
</c:if>

<c:forEach var="member" items="${ memberList }" varStatus="i">
<tr>
<td><c:out value="<%= startNum++ %>"/></td>
<td><c:out value="${ member.id }"/></td>
<td><a href="#void" onclick="memberDetail('${ member.id }')"><c:out value="${ member.name }"/></a></td>
<td><c:out value="${ member.birthday }"/></td>
<td><c:out value="${ member.cell }"/></td>
<td><c:out value="${ member.email }"/></td>
<td><c:out value="${ member.gender eq 1?'남자':'여자' }"/></td>
<td><fmt:formatDate value="${ member.inputDate }" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
</c:forEach>
</tbody>

</table>
</div>
<%-- ${param.blood eq 'a'? " selected='selected'" : "" --%>
<div style="text-align: center; ">
<form name="frmSearch" id="frmSearch" action="member_list.jsp" method="get">
<select name="field">
<option value="1" ${ param.field eq '1' ?" selected='selected'":"" }>아이디</option>
<option value="2" ${ param.field eq '2' ?" selected='selected'":"" }>주소</option>
<option value="3" ${ param.field eq '3' ?" selected='selected'":"" }>소개</option>
</select>
<input type="text" name="keyword" id="keyword" class="inputBox" value="${ param.keyword ne 'null'? param.keyword:'' }"/>
<input type="text" style="display:none;"/> <!-- 엔터를 쳐도 요청이 안되게 하나 더 넣어준다  -->
<input type="hidden" name="dataFlag" value="1"/>
<input type="button" value="btnSearch" id="btnSearch" class="btn btn-info"/>


</form>
</div>

<br>
<div style="text-align: center;">

<%--  <%for(int i=1; i < totalPage+1; i++){ %>
   [ <a href="member_list.jsp?currentPage=<%= i %>&dataFlag=1&keyword=${ param.keyword }&field=${ param.field }"> <%= i %></a> ]
<%} %>  --%>
<%
String dataFlag=request.getParameter("dataFlag");
BoardUtilVO buVO=new BoardUtilVO("member_list.jsp",dataFlag,keyword,field,currentPage,totalPage);
out.println(BoardUtil.getInstance().pageNation(buVO));
%>
</div>

</body>
</html>

