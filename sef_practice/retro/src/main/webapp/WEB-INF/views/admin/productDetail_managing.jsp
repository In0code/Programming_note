<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="관리자 - 상품리스트  / 인영 "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	width: 100%; 
	min-height: 500px;
	float: right;
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#btnLogout").click(function() {
			location.href="admin_logout_process.do";
		});//click
	
		  $("#btnChange").click(function() {
		        var pcode = "${ productOne.pcode }";
		        var confirmDelete = confirm("정말로 삭제하시겠습니까?");
		        
		        if (confirmDelete) {
		        	deleteProduct(pcode);
		        }//end if
		    });//click
		
	});//ready
	
	function deleteProduct(pcode){
				$.ajax({
					url:"productManageEdit.do",
					type:"get",
					data:"pcode="+pcode,
					dataType:"JSON",
					error:function(xhr){
						 alert("죄송합니다. 서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
						 console.log(xhr.status);
					},
					success:function(jsonObj){
						location.reload();
					}//success
				});//ajax
	}//deleteProduct
</script>

</head>
<body>
	<%@ include file="sidebar.jsp"%>
	<div id="right">
		<div id="rightHeader" align="right">
			<span style="font-weight: bold; margin-right: 20px">관리자님</span> 
			<input id="btnLogout" type="button" class="btn btn-outline-dark"
				value="로그아웃" style="margin-right: 20px">
		</div>
		<div id="rightBody">
		<div class="pageLocation">
		홈 
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		<a href="product_managing.do">
		상품 관리
		</a>
		<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
 		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		상품 상세
		</div>
		
		
		<div class="text" id="mainTitle">
			<strong>상품 상세</strong>
		</div>
		
			<form action="" id="frm" name="frm" method="post" style="left: 30px">
				<input type="hidden" id="gcode" name="gcode" value="">
				
				<div id="background_box" style="height:140%; width:80%">
					<label
						style="position: absolute; top: 10px; left: 30px; font-size: 20px; color: #929492">상품
						상세 정보</label>
					<div
						style="position: absolute; top: 60px; left: 50px; width: 350px; height: 350px">
						<img id="previewMainImg" src="http://localhost/retro_prj/upload/${ productOne.img }"
							style="width: 350px; height: 350px;" name="mainImg__div">
							<!-- ../upload/${ productOne.img } -->
					</div>
					<div
						style="position: absolute; top: 460px; left: 60px; font-size: 20px">
						<strong><label style="color: #929492">상품명</label></strong><br />
						<input type="text"
							style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px;"
							value="${ productOne.pname }" readonly="readonly">
					</div>

					<div
						style="position: absolute; top: 550px; left: 60px; font-size: 20px">
						<strong><label style="color: #929492">상품등록상태</label></strong><br />
						<c:choose>
							<c:when test="${productOne.pcancel eq 'N'}">
								<input type="text"
									style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px"
									value="등록" readonly="readonly">
							</c:when>
							<c:when test="${productOne.pcancel eq 'C'}">
								<input type="text"
									style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px"
									value="삭제 ( 관리자 )" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input type="text"
									style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px"
									value="" readonly="readonly">
							</c:otherwise>
						</c:choose>
					</div>


					<div
						style="position: absolute; top: 80px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color: #929492">아이디 ( 닉네임 )</label></strong><br />
						<input type="text"
							style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${ productOne.id } ( ${ productOne.nickname } ) " readonly="readonly">
					</div>
					<div
						style="position: absolute; top: 170px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color: #929492">카테고리</label></strong><br />
						<input type="text"
							style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${ productOne.category } > ${ productOne.category2 } > ${ productOne.category3 }" readonly="readonly">
					</div>
					<div
						style="position: absolute; top: 260px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color: #929492">삼품가격</label></strong><br />
						<fmt:formatNumber pattern="#,###,###" var="formattedPrice"
							value="${productOne.price}" />
						<input type="text"
							style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${formattedPrice}" readonly="readonly">
					</div>
					<div
						style="position: absolute; top: 350px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color: #929492">상품상태</label></strong><br />
						<c:choose>
							<c:when test="${productOne.status eq 'J'}">
								<input type="text"
									style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
									value="중고" readonly="readonly">
							</c:when>
							<c:when test="${productOne.status eq 'S'}">
								<input type="text"
									style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
									value="새상품" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input type="text"
									style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
									value="(미등록)" readonly="readonly">
							</c:otherwise>
						</c:choose>
					</div>
					<div
						style="position: absolute; top: 450px; left: 500px; font-size: 20px; width: 500px">
						<strong><label style="color: #929492">등록일</label></strong><br />
						<input type="text"
							style="border: 0px solid white; border-bottom: 1px solid #ccc; height: 40px; width: 500px"
							value="${ productOne.input_date }" readonly="readonly">
					</div>
					<!-- 상품 등록 상태가 '등록'일때만 '상품 삭제' 버튼 보여 줌 -->
					<c:if test="${productOne.pcancel eq 'N'}">
						<input type="button" class="btn" id="btnChange" value="상품 삭제"
							style="position: absolute; top: 620px; left: 1030px; font-size: 20px;" />
					</c:if>
				</div>
			</form>
		</div>
		<!-- <input style="position: absolute; top: 830px; left: 1700px; padding:10px"type="button" id="addProduct" name="addProduct" value="상품 새로 등록하기" class="btn btn-outline-secondary" onclick="location.href='item_add.jsp'"> -->
	</div>
</body>
</html>