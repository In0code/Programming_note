<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../cdn/cdn.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
#pageTitle {
	font-family: MADE Voyager PERSONAL_USE;
	font-size: 25px;
	text-align: center;
	margin-top: 100px;
}

#contents {
    position: relative;
    margin: 0 auto;
    width: 95%;
    max-width: 1200px;
    min-height: 700px;
}

.ec-base-table.typeList table {
    border-top: 1px solid #d7d5d5;
}

.ec-base-table table {
    position: relative;
    margin: 10px 0 0;
    border: 1px solid #d7d5d5;
    border-top: 0;
}

.board_footer {
    border: 1px solid #ccc;
    border-top: 0;
    padding: 25px 30px;
}

.board_footer .xans-board-search select {
    width: 90px;
}

select {
    height: 28px;
    border: 1px solid #d5d5d5;
    box-sizing: border-box;
}

[class^='btnNormal'],a[class^='btnNormal'] {
    display: inline-block;
    box-sizing: border-box;
    padding: 2px 8px;
    border: 1px solid #ccc;
    font-size: 13px;
    line-height: 22px;
    font-weight: normal;
    text-decoration: none;
    vertical-align: middle;
    letter-spacing: 0;
    text-align: center;
    white-space: nowrap;
    color: #999;
    background-color: #fff;
    -webkit-transition: .3s ease-in-out;
    transition: .3s ease-in-out;
}

thead,
tbody,
tfoot,
tr,
td,
th {
  border-color: inherit;
  border-style: solid;
  border-width: 0;
}

.notice-top-line {
	position: relative;
    /*background-color: #1D1B0C;*/
}

.notice-top-line .inner {
	width: 100%;
	display: flex;
	align-items: center;
}

.notice-top-line .inner .swiper {
	width: 100%;
	height: 42px;
}

.notice-top-line .inner .swiper .swiper-slide {
	height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}

 .notice-top-line .inner .swiper .swiper-slide:nth-child(2){
	height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}
/* 나중에 6번째 추가할 때 복사하기 */
.notice-top-line .inner .swiper .swiper-slide:nth-child(3){
    background-color:#bab8ac;
}
    .notice-top-line .inner .swiper .swiper-slide:nth-child(1){
  height: 42px;
    width:100%;
    background-color:#1D1B0C;
    text-align: center;
}

.notice-top-line .inner .swiper .swiper-slide img {    
    height: 42px;
}  

.ec-base-table thead th {
    padding: 15px 0 14px;
    border-bottom: 1px solid #dfdfdf;
    color: #353535;
    vertical-align: middle;
    font-weight: normal;
    color: #888;
}

input,select,textarea {
    color: #000;
    vertical-align: middle;
}

input[type=text],input[type=password] {
    height: 22px;
    line-height: 20px;
    padding: 2px 4px;
    border: 1px solid #d5d5d5;
    color: #353535;
}

</style>


<script type="text/javascript">
$(function() {
	
	
});//ready
</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>
<div id="pageTitle">Notice</div><br>

<div id="wrap" style="font-family:Pretendard Medium;">    
	<div id="wrap_inner">     
		<div id="container">
			<div id="contents">
				<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
					<div class="boardSort">
                		<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
   					 </div>
					<div class="ec-base-table typeList gBorder">
        				<table border="1" summary="" style="text-align:center; font-size:13px">
							<caption>게시판 목록</caption>
							<!-- 컬럼 사이즈 -->
           					<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
           						<col style="width:70px;"/>
								<col style="width:auto;"/>
								<col style="width:140px;"/>
								<col style="width:140px;" class=""/>
							</colgroup>
							
							<!-- thead(컬럼명) -->
							<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							  <tr style=" ">
								<th scope="col"> NO.</th>
                    			<th scope="col"> SUBJECT</th>
                    			<th scope="col"> NAME</th>
                    			<th scope="col" class="">DATE</th>
                			  </tr>
                			</thead>
                			
                			<!-- tbody(게시글 목록) -->
							<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
							
							<!-- 게시글 시작 -->
							<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
								<td> 번호</td>
                    			<td class="displaynone"></td>
                    			<td class="subject left txtBreak">
                        			<!-- 제목 -->
                        			<a href="http://localhost/cherie_ysy_private/view/notice_detail.jsp">
                        				Chérie 10월 한글날 배송 안내 (10/6 - 10/9) 
                        			</a>                     
                        		</td>
                        		<!-- 작성자 -->
                    			<td>관리자</td>
                    			<!-- 작성일 -->
                    			<td class="">2023-10-04</td>
                			</tr>
                			<!-- 게시글 끝 -->
                			
							</tbody>
					</table>

<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone ">　
</p>
    </div>
    
    <!-- 하단 검색 영역 -->
    <div class="board_footer">
		<form id="boardSearchForm" name="" action="/board/notice/1" method="get" target="_top" enctype="multipart/form-data">
			<input id="board_no" name="board_no" value="1" type="hidden">
			<input id="page" name="page" value="1" type="hidden">
			<input id="board_sort" name="board_sort" value="" type="hidden">
			<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
				<fieldset class="boardSearch">
					<legend>게시물 검색</legend>
					<p class="category displaynone"></p>
						<p>
						<select id="search_key" name="search_key" style="font-family:Pretendard Medium" fw-filter="" fw-label="" fw-msg="">
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select> 
						<input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" 
								placeholder="" value="" type="text" style="padding: 13px; font-family:Pretendard Medium"> 
						<a href="#none" class="btnNormalFix" onclick="BOARD.form_submit('boardSearchForm');" style="border:0; padding:10px">
							SEARCH
						</a>
						</p>
				</fieldset>
			</div>
		</form>
	</div>
	<!-- 하단 검색 영역 끝 -->

            <!-- 페이지 네이션 -->
            <div class="xans-element- xans-product xans-product-reviewpaging ec-base-paginate typeList">
            	<a href="#none" class="first">첫 페이지</a>
				<a href="#none">이전 페이지</a>
				<ol>
					<li class="xans-record-"><a href="?page_4=1#use_review" class="this">1</a></li>
                    <li class="xans-record-"><a href="?page_4=2#use_review" class="other">2</a></li>
                    <li class="xans-record-"><a href="?page_4=3#use_review" class="other">3</a></li>
                    <li class="xans-record-"><a href="?page_4=4#use_review" class="other">4</a></li>
                    <li class="xans-record-"><a href="?page_4=5#use_review" class="other">5</a></li>
                </ol>
				<a href="?page_4=2#use_review">다음 페이지</a>
				<a href="?page_4=228#use_review" class="last">마지막 페이지</a>
			</div>

</div>
</div>
</div>
</div>
</div>

<%@ include file="layout/footer.jsp"%>
</body>
</html>