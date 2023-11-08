<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
	padding: 40px;
	padding-left: 56px;
	background: #EEEEEE;
	position: relative;
}

/* 인영 - 주문관리 style  시작*/
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

textarea{ resize: none; }

</style>
<!-- 태균이가 만든거 끝-->
<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){//유효성검증
		
		if($("#goodsCode").val()!=null && $("#goodsName").val()!=null && ($("#goodsName").val()!="내용을 입력해주세요") && ($("#goodsCode").val()!="내용을 입력해주세요") ){
			$("#frm").submit();
		} else {
			alert("상품명과 상품코드를 함께 입력해주세요.")
		}
	})
/* 	$("#btnLogout").click(function() {
		location.href="logout.jsp";
	});
	 */
	
////
});//ready

</script>

</head>

<body>
<%@ include file="sidebar.jsp" %>
<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="text" id="mainTitle">
			<strong>상품 등록</strong>
		</div>
		
<form action="item_add_process.jsp" id="frm" name="frm" method="post"  enctype="multipart/form-data" style="position:relative; left:30px" >
		
		<div id="background_box" style="width: 1200px; height:750px; font-family:  pretendard; margin-left: -70px ; margin-top: -50px"> <!-- 각자 원하는데로 사용 -->
																									<input type="text" id="goodsName" name="goodsName"   style="position: absolute; top: 43px; left: 90px; height: 30px; width:260px" value="정보를 입력해주세요">
		<label style="position: absolute; top: 40px; left: 20px; font-size: 20px">상품명 : </label><!-- <textarea  id="goodsName" name="goodsName"  style="position: absolute; top: 43px; left: 90px; height: 30px; width:260px" >내용을 입력해주세요</textarea> -->
																												<input type="text" id="goodsCode" name="goodsCode"  style="position: absolute; top: 43px; left: 470px; height: 30px; width:150px" value="정보를 입력해주세요">
		<label style="position: absolute; top: 40px; left: 380px; font-size: 20px">상품코드 : </label><!-- <textarea id="goodsCode" name="goodsCode" style="position: absolute; top: 43px; left: 470px; height: 30px; width:150px" >내용을 입력해주세요</textarea> -->
		<label style="position: absolute; top: 100px; left: 20px; font-size: 20px">상세정보</label>
		<!-- <div id="tmi" style="border: 1px solid #333; width: 630px ; height: 370px; position: relative; top: 140px; left: 20px  "></div> -->
		<textarea id="tmi" name="tmi" style="border: 1px solid #333; width: 630px ; height: 185px; position: relative; top: 140px; left: 20px; resize: none;   " placeholder="상세 정보를 입력해주세요"></textarea>
		
		<textarea id="engTmi" name="engTmi" style="border: 1px solid #333; width: 630px ; height: 185px; position: absolute; top: 340px; left: 20px; resize: none; " placeholder="상세 정보(영문)를 입력해주세요"></textarea>
		
		
		<div id="note"style="border: 0px solid #333; width: 630px ; height: 130px; position: relative; top: 340px; left: 20px">
				<label style="margin-left: 20px">topnote</label><br><textarea id="top" name="top" style="border: 1px solid #333; margin-left: 20px; height: 80px ; resize: none;" placeholder="정보를 입력해주세요" ></textarea>
				<label style="position: absolute; top: 0px; left: 220px" >heart</label><textarea id="heart" name="heart" style="border: 1px solid #333; height: 80px; resize: none; position: absolute; top: 23px; left: 220px" placeholder="정보를 입력해주세요" ></textarea>
				<label style="position: absolute; top: 0px; left: 420px">base</label><br><textarea id="base" name="base"  style="border: 1px solid #333; height: 80px; resize: none; position: absolute; top: 23px; left: 420px" placeholder="정보를 입력해주세요"></textarea>
		</div>
		
		<%-- <div style="position: absolute; top: 40px; left: 680px; border: 1px solid #333; width: 400px; height: 400px"><img id="previewMainImg"  src="../upload/goods/${product.mainImg eq null ? 'img_null.png' : product.mainImg}" style="width:400px ;height:400px ;" id="mainImg__div" name="mainImg__div"></div> --%>
		<label  style="position: absolute; top: 140px; left: 700px; ">Main image : </label>
		<input type="file" id="mainImg" name="mainImg"  class="inputBox" style="position: absolute; top: 140px; left: 800px; resize: none;">
		<%-- <div  style="position: absolute; top: 40px; left: 1100px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewImg1" name="previewImg1"  src="../upload/goods/${product.img1 eq null ? 'img_null.png' : product.img1}" style="width:160px ;height:160px"></div> --%>
				<label  style="position: absolute; top: 190px; left: 700px; ">image1 : </label>
	 <input type="file" id="img1" name="img1"  class="inputBox" style="position: absolute; top: 190px; left: 800px; resize: none;">
		
	 <%-- <div style="position: absolute; top: 40px; left: 1320px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewImg2"  src="../upload/goods/${product.img2 eq null ? 'img_null.png': product.img2}" style="width:160px ;height:160px"></div> --%>
	 <label  style="position: absolute; top: 240px; left: 700px; ">image2 : </label>
		<input type="file" id="img2" name="img2"  class="inputBox" style="position: absolute; top: 240px; left: 800px; resize: none;">
	 
		<label  style="position: absolute; top: 290px; left: 700px; ">image3 : </label>
		<input type="file" id="img3" name="img3"  class="inputBox" style="position: absolute; top: 290px; left: 800px; resize: none;">
		
		<%-- <div style="position: absolute; top: 280px; left: 1320px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewDetailImg"  src="../upload/goods/${product.detailImg eq null ? 'img_null.png' : product.detailImg }" style="width:160px ;height:160px"></div> --%>
				<label  style="position: absolute; top: 340px; left: 700px; ">Detail image : </label>
		<input type="file" id="detailImg" name="detailImg"  class="inputBox" style="position: absolute; top: 340px; left: 800px; resize: none;">
		 
		<button type="button" id="btnAdd" style="position: absolute; top: 650px; left:1050px;  width:120px; height: 50px" class="btn btn-outline-secondary">등록</button>
		
		<div  style="position: absolute; top: 430px; left: 700px; border: 0px solid #333; width: 200px; height: 50px; font-size: 20px"><label>가격: </label>  <input type="text" id="price" name="price" style="width: 120px; heigth: 25px; resize: none;" value="0"/></div>
		<div  style="position: absolute; top: 485px; left:700px; border: 0px solid #333; width: 200px; height: 50px; font-size: 20px"><label>수량: </label>  <input type="text" id="quantity" name="quantity" style="width: 120px; heigth: 25px; resize: none; " value="0"/></div>
		<label style="position: absolute; top: 550px; left:700px;" >ingredient : </label><textarea id="ing" name="ing" style="width: 300px ; height: 80px ;  resize: none; position: absolute; top: 550px; left:790px" placeholder="정보를 입력해주세요" ></textarea>
		 <span id="imgSuccess" style="position: absolute; top: 620px; left:1320px;"></span>
</div>
	</form>	 
		
	</div>	
</div>
</body>
</html>