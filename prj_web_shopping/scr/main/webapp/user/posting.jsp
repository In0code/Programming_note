<%@page import="admin.vo.BoardRangeVO"%>
<%@page import="common.dao.BoardDAO"%>
<%@page import="common.util.BoardUtilVO"%>
<%@page import="common.util.BoardUtil"%>

<%@page import="user.vo.SummaryVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">




<style type="text/css">
.pagenationDiv{
	position: absolute;
	top: 775px;
	width: 1480px;
	text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a{
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  background-color: white;
}

.pagination span{
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  background-color: white;
}

.pagination a.active {
  background-color: black;
  color: white;
  border: 1px solid #333;
}

.pagination span.active {
  background-color: black;
  color: white;
  border: 1px solid #333;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

a {
	text-decoration: none;
	color: #333;
}

a:hover {
	color: #333;
}
</style>

<jsp:useBean id="sVO" class="user.vo.SummaryVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="sVO"/>


<%




UserReviewDAO uDAO= UserReviewDAO.getInstance();
BoardDAO bDAO=BoardDAO.getInstance();
BoardRangeVO brVO=new BoardRangeVO();
String id =(String)session.getAttribute("sesId");
String field=request.getParameter("field");
System.out.println(field+"=====");
String keyword=request.getParameter("keyword");
System.out.println(keyword+"=====");
brVO.setTableName("REVIEW");

brVO.setField(field);
brVO.setKeyword(keyword);
int totalCount=uDAO.postingTotalCount(brVO, id);
//
//


int pageScale=10; // 한 화면에 보여줄 게시물의 수
int totalPage=0; // 총 페이지 수

totalPage=(int)Math.ceil(totalCount/(double)pageScale);


String tempPage=request.getParameter("currentPage");
int currentPage=1;
if(tempPage != null){
	currentPage=Integer.parseInt(tempPage);
}//end if

int startNum=currentPage*pageScale-pageScale+1;
pageContext.setAttribute("startNum", startNum);


//끝페이지 번호 구하기
int endNum=startNum+pageScale-1;

brVO.setStartNum(startNum);
brVO.setEndNum(endNum); 
//mDAO.


try{
	List<SummaryVO> list = uDAO.selectAllReview(id, brVO);
	
	pageContext.setAttribute("reviewList", list);
}catch (SQLException se) {
	se.printStackTrace();
}//end catch

%>

<script type="text/javascript">
$(function(){

	
	$("#btnSearch").click(function(){
		chkNull();
		
	});
	
	$("#keyword").keyup(function(evt) {
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keyup
	
	
});//ready


function chkNull(){
	var keyword =  $("#keyword").val();

	if(keyword.trim()==""){
		alert("검색 키워드를 입력해주세요. k : '"+keyword+"'");
		return;
	}//end if
	
	//모두 통과했으면 submit
	$("#frmSearch").submit();
}//chkNull




</script>


</head>








<%@include file="layout/header.jsp" %>

<body>



<div id="wrap">    
<div id="wrap_inner">     
<div id="container">
<div id="contents">

<div class="titleArea">
    <h4 style="font-family:pretend">게시물 관리</h4>
</div>

<form id="frmSearch"  action="posting.jsp?field=${param.field}&keyword=${param.keyword}" >
<div class="xans-element- xans-myshop xans-myshop-boardpackage "><div class="board_top">
        
<fieldset class="boardSearch">	
        <p><select id="field" name="field"  >
<option value="1">내용</option>
<option value="2">카테고리</option>



</select> 
<input id="keyword" name="keyword"  style="height:27px" class="inputTypeText" placeholder="내용을 입력해주세요"
	 value="${param.keyword eq null or empty param.keyword or param.keyword eq 'null'  ? '' : param.keyword }" type="text"  /><%-- ${review.star eq 2 ? "checked='checked'" : "" } --%>
	 <input type="hidden">
<input type="text" style="display: none"	placeholder="내용을 입력해주세요"> 
<input type="button" id="btnSearch" name="btnSearch" class="btnNormalFix" style="height:27px" value="search">
 </p>
    </fieldset>
</div>
</div>
</form>        
<div class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">

<table border="1" summary="" style="table-layout:fixed" >
<caption>게시물 관리 목록</caption>
        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 "><col style="width:70px;"/>
<col style="width:140px;"/>
<col style="width:400px;"/>
<col style="width:140px;"/>
<col style="width:140px;"/>
<col style="width:50px;"/>
</colgroup>
<thead>
<tr style="text-align: center">
<th scope="col" style="padding:10px;">NO.</th>
                <th scope="col">ProductName</th>
                <th scope="col">SUBJECT</th>
                <th scope="col">NAME</th>
                <th scope="col">DATE</th>
                <th scope="col">HIT</th>
</tr>
</thead>
               <c:if test="${ empty reviewList}">
       <p class="message" style="width:1220px;position: absolute; top:180px">작성한 게시물이 없습니다.</p>
       </c:if>
      
<c:forEach var="review" items="${reviewList}" varStatus="i">

         <tr style="text-align:  center;">
                <td><span class="txtNum"><c:out value="<%=startNum++ %>"/></span></td>
                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis; "><span class="txtNum" style="font-size: 10px;"><a href="posting_detail.jsp?rcode=${review.rcode }" 
   onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.gname}" /></a></span></td>
                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><span class="txtNum">     <a href="posting_detail.jsp?rcode=${review.rcode }" 
   onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.review}" /></a>  </span></td>
                <td><span class="txtNum"><a href="posting_detail.jsp?rcode=${review.rcode }" 
   onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.name}" /></a></span></td>
                <td><span class="txtNum"><a href="posting_detail.jsp?rcode=${review.rcode }" 
   onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.reviewDate}" /></a></span></td>
                <td><span class="txtNum"><a href="posting_detail.jsp?rcode=${review.rcode }" 
   onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.view}" /></a></span></td>
                
                
            </tr>
            </c:forEach>
            
     


            
           


</table>


</div><div id="pageNation" style="position: absolute; top: -80px; left: 210px">
   <c:if test="${ not empty reviewList }">
      <!-- 페이지네이션 -->
      <div class="pagenationDiv" style="text-align: center;">
         <div class="pagination" >
          <%
          BoardUtil util=BoardUtil.getInstance();
         BoardUtilVO buVO=new BoardUtilVO("posting.jsp",keyword,field,currentPage,totalPage);
         out.println(util.pageNation(buVO));
          %>
         </div>
      </div>
      </c:if>
      </div> 
</div>
</div>   
</div>  
</div>
       
  
    
 

 <%@ include file="postingfooter.jsp" %> 
</body>
</html>