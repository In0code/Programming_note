<%@page import="shop_prj.WishListVO"%>
<%@page import="shop_prj.WishListDAO"%>
<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.member.vo.BoardUtilVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.WebMemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.member.vo.BoardRangeVO"%>
<%@page import="kr.co.sist.member.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<jsp:include page="cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet"/>

<style type="text/css">
#cart{
/* Font & Text */
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
font-size: 13px;
line-height: 20px;
text-decoration: none solid rgb(153, 153, 153);
text-align: center;
word-spacing: 0px;
/* Color & Background */
background-color:  #FFFFFF;
background-position: 0% 0%;
color:  #999999;
/* Box */
height: 20px;
width: 1200px;
margin: 50px 0 50px 0;
/* Positioning */
display: block;
/* Effects */
transform: none;
transition: all 0s ease 0s;
outline:1px;
}
#btnBlack{
/* Font & Text */
font-size: 14px;
line-height: 22px;
text-align: center;
vertical-align: middle;
background-color:  #141414;
color:  #FFFFFF;
height: 56px; width: 500px;
padding: 16px 16px 16px 16px;
min-width: 80px;
cursor: pointer;
box-sizing: border-box;
}
#btnSubmit{
font-size: 14px;
line-height: 22px;
text-align: center;
background-color:  #FFFFFF;
color:  #000000;
height: 56px; width: 500px;
padding: 16px 16px 16px 16px;
min-width: 80px;
cursor: pointer;
box-sizing: border-box;
}


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
<%@include file="header.jsp" %>
<%
WishListDAO wlDAO=WishListDAO.getInstance();
WishListVO wlVO=new WishListVO();

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

<div id="container">
<div id="contents">
<div>
<table class="table" style="border: 1px solid #E5E4E4;">
<thead>
<tr style="border: 1px solid #E5E4E4;">
<td  style="width:10px;  color: #929492"><input type="checkbox" style="border: 1px solid #929492 ; width: 15px; height: 15px"></td>
<td style="width:100px; text-align: left; color: #929492;">이미지</td>
<td style="width:350px;  text-align: center; color: #929492">상품정보</td>
<td style="width:350px;  text-align: center;color: #929492">판매가</td>
<td style="width:100px;  color: #929492">배송비</td>
<td style="width:100px ;text-align: right; color: #929492">합계</td>
<td style="width:100px; text-align: right;color: #929492">선택</td>

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


</div>
 <div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per"><ul class="grid2">
<a href="" class="btnBlack" id="btnBlack">전체상품주문</a>
        <a href="" class="btnSubmit" id="btnSubmit">선택상품주문</a> 
        </ul>
        </div>
</div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>