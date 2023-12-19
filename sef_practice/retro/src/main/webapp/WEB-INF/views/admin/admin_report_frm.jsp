<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery CDN -->

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 태균이가 만든거 -->
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
	padding: 20px;
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


</style>
<!-- 태균이가 만든거 끝-->

<script type="text/javascript">
$(function() {
	
	
	$("#searchBtn").click(function(){
		
			$("#frmSearch").submit();	
	});
	
	
	
});//ready
//목록가기
function moveInquery() {
	
		location.href="admin_report_frm.do";

}
//로그아웃
function logOut() {
	location.href="admin_logout_process.do";
}

</script>
</head>
<body>
<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" onclick="logOut()" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		신고내역
		</div>
		
		<div class="text" id="mainTitle">
			<strong>신고 리스트</strong>
			
		</div>
		
		<!-- 검색 -->
		<div class="searchDiv">
		<div class="allBox">
		<form id="frmSearch" action="admin_report_frm.do" method="get">
			<select class="searchList" id="field" name="field">
				<option value="id" ${ param.field eq "id" ? " selected='selected'" : "" }>신고인</option>
				<option value="reportId" ${ param.field eq "reportId" ? " selected='selected'" : "" }>피신고인</option>
				<option value="type" ${ param.field eq "type" ? " selected='selected'" : "" }>신고유형</option>
			</select>
			<span class="textBox" style="vertical-align: middle">
			<input type="text" id="keyword" name="keyword" class="keywordBox" placeholder="내용을 입력해주세요"
			value = "${ param.keyword ne 'null' ? param.keyword : ''}"/>
			<input type="text" style="display: none;"/>
			</span>
			<button class="searchBtn">
			<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#858585" class="bi bi-search" viewBox="0 0 16 16">
  			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
			</button>
		</form>
		</div>
		</div>
		<!---->
		
		<!-- 상세보기 페이지로 -->
	
			

		
		<!-- 테이블 -->
		<div id="background_box">
		<div style="margin: 10px; text-align: center;">
			<!-- 리스트 시작 -->
			<table class="table tableList">
				<thead>
				<tr id="top_title">
					<!-- 컬럼 사이즈 -->
					<th style="width:100px; border-bottom: 1px solid #E5E5E5;">No</th>
					<th style="width:150px; border-bottom: 1px solid #E5E5E5;">상품명</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">신고내역</th>
					<th style="width:100px; border-bottom: 1px solid #E5E5E5;">카테고리</th>
					<th style="width:100px; border-bottom: 1px solid #E5E5E5;">신고인</th>
					<th style="width:100px; border-bottom: 1px solid #E5E5E5;">피신고인</th>
					<th style="width:200px; border-bottom: 1px solid #E5E5E5;">신고일</th>
				</tr>
				</thead>
				
				<tbody>
					<!-- list가 존재하지 않을 경우 -->
					<c:if test="${ empty reportList }">
					<tr >
						<td colspan="7" style="text-align: center; border:none;"> 
							신고 내역이 존재하지 않습니다. </td>
					</tr>
					</c:if>
				
					<c:forEach var="rep" items="${ reportList }" varStatus="i">
					<tr >
					 <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;  width:30px"><span class="" style="font-size: 18px" >
                	<a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${i.index+startNum}"/></a></span></td>
                <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;width:50px; text-align:center; "><span class="" style="font-size: 18px"> <c:out value="" />
                   <a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${rep.pname}"/></a>  </span></td>
                          <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;  width:50px; text-align:center; "><span class="" style="font-size: 18px"> <c:out value="" />
                   <a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${rep.type}"/></a>  </span></td>
                              <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;  width:50px; text-align:center; "><span class="" style="font-size: 18px"> <c:out value="" />
                   <a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${rep.category}"/></a>  </span></td>
                              <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;  width:50px; text-align:center; "><span class="" style="font-size: 18px"> <c:out value="" />
                   <a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${rep.id}"/></a>  </span></td>
                <td style="border-left:none; border-right: none;border-top: none; text-align:center; "><span class="txtNum" style="font-weight: bold; font-size: 18px;  "  >
                	<a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${rep.reportId}"/></a></span></td>
                <td style="border-left:none; border-right: none;border-top: none; text-align:center; "><span class="txtNum" style="font-weight: bold; font-size: 18px;  "  >
                	<a href="admin_report_detail_frm.do?rcode=${rep.rcode}" ><c:out value="${rep.inputDate}"/></a></span></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<!---->
		
			<!-- pagination -->
		<div class="pagenationDiv">
    	<div class="pagination">
    		<c:if test="${pageEnd != 1 }">
	    		<c:choose>
	    			<c:when test="${empty param.page }">
	    				<c:forEach var="pn" begin="1" end="${pageEnd }" step="1">
		    				<a href="admin_report_frm.do?page=${pn }">
		    				<c:if test="${pn == 1 }">
			    				<span class="active">1</span>
		    				</c:if>
		    				<c:if test="${pn != 1 }">
		    					${pn }
		    				</c:if>
		    				</a>
	    				</c:forEach>
	    			</c:when>
		    		<c:when test="${pageEnd != 1 }">
		    			<c:forEach var="pn" begin="${pageStart }" end="${pageEnd }" step="1">
			        		<a href="admin_report_frm.do?page=${pn }">
			        			<c:choose>
				    				<c:when test="${param.page == pn }">
							        	<span class="active">${pn }</span>
				    				</c:when>
				    				<c:otherwise>
				    					${pn }
				    				</c:otherwise>
			        			</c:choose>
		    				</a>
		    			</c:forEach>
		    		</c:when>
	    		</c:choose>
    		</c:if>
    	</div>
    </div>
		<!-- pagination -->
    	
    	<!-- 버튼 쓸 사람 -->
    	<div class="btnDiv">
			<input type="button" class="btnCss" value="목록" onclick="moveInquery() " id="btn1" name="btn1" >	
		</div>
		<!---->
			
	</div>	
</div>
</body>
</html>