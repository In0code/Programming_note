<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">




<style type="text/css">


</style>




<script type="text/javascript">

$(function() {
   
   
});//ready
</script>

</head>
<body>
<%@include file="layout/header.jsp" %>

<%@page import="user.vo.SummaryVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@page import="java.sql.SQLException"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
		$("#btn").click(function() {
			window.open("posting_control.jsp" , "", "width=513, height=710, top=50, left=50");
		})
   	
		$("#btnSearch").click();
});//ready
</script>

</head>
<body>

<jsp:useBean id="sVO" class="user.vo.SummaryVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="sVO"/>


<%




UserReviewDAO uDAO= UserReviewDAO.getInstance();


//mDAO.


try{
	List<SummaryVO> list = uDAO.selectAllReview("tuna5127");
	
	pageContext.setAttribute("reviewList", list);
}catch (SQLException se) {
	se.printStackTrace();
}//end catch


%>

<div id="wrap">    
<div id="wrap_inner">     
<div id="container">
<div id="contents">

<div class="titleArea">
    <h2>게시물 관리</h2>
</div>

<div class="xans-element- xans-myshop xans-myshop-boardpackage "><div class="board_top">
        
<form id="boardSearchForm" name="" action="/myshop/board_list.html" method="get" target="" enctype="multipart/form-data" >
<input id="board_no" name="board_no" value="" type="hidden"  />
<input id="page" name="page" value="1" type="hidden"  />
<input id="board_sort" name="board_sort" value="" type="hidden"  /><div class="xans-element- xans-myshop xans-myshop-boardlistsearch "><fieldset class="boardSearch">
<legend>게시물 검색</legend>
        <p><select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg=""  >
<option value="writer_name">이름</option>
<option value="subject">카테고리</option>
<option value="content">내용</option>


</select> <input id="search" name="search"  style="height:27px" class="inputTypeText" placeholder="" value="" type="text"  />
<input type="button" id="btnSearch" class="btnNormalFix" style="height:27px" value="search">
 </p>
    </fieldset>
</div>
</form>        
</div>
<div class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">

<table border="1" summary="">
<caption>게시물 관리 목록</caption>
        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 "><col style="width:70px;"/>
<col style="width:140px;"/>
<col style="width:auto;"/>
<col style="width:140px;"/>
<col style="width:140px;"/>
<col style="width:50px;"/>
</colgroup>
<thead>
<tr style="text-align: center">
<th scope="col" style="padding:10px;">NO.</th>
                <th scope="col">CATEGORY</th>
                <th scope="col">SUBJECT</th>
                <th scope="col">NAME</th>
                <th scope="col">DATE</th>
                <th scope="col">HIT</th>
</tr>
</thead>
            
     
<tbody style="text-align: center">
       <c:if test="${ empty reviewList}">
       <p class="message">작성한 게시물이 없습니다.</p>
       </c:if>
      
<c:forEach var="review" items="${reviewList}" varStatus="i">

			<tr>
                <td><span class="txtNum"><c:out value="${i.count}"/></span></td>
                <td><span class="txtNum"><a href="posting_control.jsp?rcode=${review.rcode }" 
	onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.category}" /></a></span></td>
                <td><span class="txtNum">     <a href="posting_control.jsp?rcode=${review.rcode }" 
	onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.review}" /></a>  </span></td>
                <td><span class="txtNum"><a href="posting_control.jsp?rcode=${review.rcode }" 
	onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.name}" /></a></span></td>
                <td><span class="txtNum"><a href="posting_control.jsp?rcode=${review.rcode }" 
	onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.reviewDate}" /></a></span></td>
                <td><span class="txtNum"><a href="posting_control.jsp?rcode=${review.rcode }" 
	onclick="window.open(this.href, '', 'width=530 , height=710, top=120, left=650'); return false;"><c:out value="${review.view}" /></a></span></td>
                
                
            </tr>
            </c:forEach>
</tbody>

</table>
           

</div>
</div>
</div>   
</div>  
</div>   
</div>  

 

 <%@ include file="postingfooter.jsp" %> 
</body>
</html>