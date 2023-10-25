<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
width: 1000px;
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
text-align: center;
background-color:  #141414;
color:  #FFFFFF;
height: 56px; width: 500px;
padding: 16px 16px 16px 16px;
}
#btnSubmit{
font-size: 14px;
text-align: center;
background-color:  #FFFFFF;
color:  #000000;
height: 56px; width: 500px;
padding: 16px 16px 16px 16px;
}
#pageTitle {
	font-family: MADE Voyager PERSONAL_USE;
	font-size: 25px;
	text-align: center;
	margin-top: 100px;
}
.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
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
<%@ include file="layout/header.jsp"%>
<%-- <%
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
%> --%>

<div id="pageTitle">관심상품</div><br>
<div id="container">
<div id="contents">
<div>
<table class="table" style="border: 1px solid #E5E4E4;">
<thead>
<tr style="border: 1px solid #E5E4E4;">
<th  style="width:10px;  color: #929492"><input type="checkbox" style="border: 1px solid #929492 ; width: 15px; height: 15px"></td>
<th style="width:100px; text-align: left; color: #929492;">이미지</th>
<th style="width:350px;  text-align: center; color: #929492">상품정보</th>
<th style="width:350px;  text-align: center;color: #929492">판매가</th>
<th style="width:100px;  color: #929492">배송비</th>
<th style="width:100px ;text-align: right; color: #929492">합계</th>
<th style="width:100px; text-align: right;color: #929492">선택</th>
</tr>
</thead>
<tbody>

<c:if test="${ empty memberList }">
<tr>
<td colspan="8" style="text-align: center; color: #929492">회원정보가 존재하지 않습니다</td>
</tr>
</c:if>

<%-- <c:forEach var="member" items="${ memberList }" varStatus="i">
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
 <div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per"><ul class="grid2">
<a href="" class="btnBlack" id="btnBlack">전체상품주문</a>
        <a href="" class="btnSubmit" id="btnSubmit">선택상품주문</a> 
        </ul>
        </div>
          <!-- 페이지 네이션 -->
            <div class="xans-element- xans-product xans-product-reviewpaging ec-base-paginate typeList">
            	<a href="#none" class="first">첫 페이지</a>
				<a href="#none">이전 페이지</a>
				<ol>
					<li class="xans-record-"><a href="?page_4=1#use_review" class="this">1</a></li>
                    <li class="xans-record-"><a href="?page_4=2#use_review" class="other">2</a></li>
                    <li class="xans-record-"><a href="?page_4=3#use_review" class="other">3</a></li>
                </ol>
				<a href="?page_4=2#use_review">다음 페이지</a>
				<a href="?page_4=228#use_review" class="last">마지막 페이지</a>
			</div>
</div>
<%-- ${param.blood eq 'a'? " selected='selected'" : "" --%>

<br>
<!-- <div style="text-align: center;"> -->

<%--  <%for(int i=1; i < totalPage+1; i++){ %>
   [ <a href="member_list.jsp?currentPage=<%= i %>&dataFlag=1&keyword=${ param.keyword }&field=${ param.field }"> <%= i %></a> ]
<%} %>  --%>
<%-- <%
String dataFlag=request.getParameter("dataFlag");
BoardUtilVO buVO=new BoardUtilVO("member_list.jsp",dataFlag,keyword,field,currentPage,totalPage);
out.println(BoardUtil.getInstance().pageNation(buVO));
%> --%>
<!-- </div> -->


</div>
<%@ include file="layout/footer.jsp"%>
</div>

</body>
</html>