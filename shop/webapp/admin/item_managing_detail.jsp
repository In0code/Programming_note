<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<jsp:include page="../cdn/admin_cdn.jsp"/>
<%@ include file="sidebar.jsp" %>
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

background-color:  #FFFFFF;
color:  #333333;
height: 150%; width: 100%;
position: absolute;
top: 100px; left: 60px;
outline:  1px;
box-shadow: rgb(204, 202, 202) 0px 2px 8px 0px;
border-radius: 9px;
}

textarea{   
        resize: none;
    }

</style>
<script type="text/javascript">
$(function(){
	
	
	
	$("#btnUpdate").click(function(){
		$("#frm").submit();
	});
	
	   $('#mainImg').change(function(){
		 	  var file=event.target.files[0];
		 	  var reader=new FileReader( );
		 	  reader.onload=function(e){
		 		  $("#previewMainImg").attr("src",e.target.result);
		 	  }
		 	  
		 	  reader.readAsDataURL(file);
		 	  alert("파일 선택 후 이미지 업로드 버튼을 눌러주세요.")
		  
		   });//change
		   
		   $('#img1').change(function(){
			 	  var file=event.target.files[0];
			 	  var reader=new FileReader( );
			 	  reader.onload=function(e){
			 		  $("#previewImg1").attr("src",e.target.result);
			 	  }
			 	  
			 	  reader.readAsDataURL(file);
			  
			   });//change
			   $('#img2').change(function(){
				 	  
				 	  var file=event.target.files[0];
				 	  var reader=new FileReader( );
				 	  reader.onload=function(e){
				 		  $("#previewImg2").attr("src",e.target.result);
				 	  }
				 	  
				 	  reader.readAsDataURL(file);
				  
				   });//change
				 
				   $('#img3').change(function(){
					 	
					 	  alert("ccc");
					 	  var file=event.target.files[0];
					 	  var reader=new FileReader( );
					 	  reader.onload=function(e){
					 		  $("#previewImg3").attr("src",e.target.result);
					 	  }
					 	  
					 	  reader.readAsDataURL(file);
					  
					   });//change
					  
					   $('#detailImg').change(function(){
						 	
						 	  
						 	  var file=event.target.files[0];
						 	  var reader=new FileReader( );
						 	  reader.onload=function(e){
						 		  $("#previewDetailImg").attr("src",e.target.result);
						 	  }
						 	  
						 	  reader.readAsDataURL(file);
						  
						   });//change
						   
						   
						   $("#btnImgSubmit").click(function(){
					   var frm=$("#frm")[0];
							   
							   var formData= new FormData(frm);
							   
							   $.ajax({
								  url:"item_managing_upload_process.jsp",
								  type:"post",
								  processData:false,
								  contentType:false,
								  data: formData,
								  async:false,
								  dataType:"json",
								  error:function(xhr) {
						 			 
						 			 $("#imgSuccess").html("업로드 실패");
						 			 alert(xhr.status);
						 			 console.log(xhr.status);
								  },
								  success:function(jsonObj){
									  var msg="이미지 업로드 완료";
									  
							
					    			  
									  $("#imgSuccess").html(msg);
									
									  }
							   });//ajax
						   });
});//ready
</script>

</head>
<body>
<jsp:useBean id="pVO" class="admin.vo.ProductManageVO" scope="page"></jsp:useBean> 
<jsp:setProperty property="*" name="pVO"/>
<% ProductDAO pDAO= ProductDAO.getInstance();
	String gcode="BC0001";//Integer.parseInt(request.getParameter("gcode"));
	System.out.println(gcode);
	try{
		
	pVO= pDAO.selectOneProduct(gcode);
	pageContext.setAttribute("product", pVO);
	}catch(SQLException se ) {
		se.printStackTrace();
	}
%>



<div id="right">
	<div id="rightHeader" align="right">
		<span style="font-weight: bold;margin-right: 20px">관리자님</span>
		<input id="btnLogout" type="button" class="btn btn-outline-dark" value="로그아웃" style="margin-right: 20px">
	</div>
	<div id="rightBody">
		<div class="text" id="mainTitle">
			<strong>상품 상세 정보</strong>
		</div>
		<form action="item_managing_frm_process.jsp" id="frm" name="frm" method="post" style="position:relative; left:30px" >
		<div id="background_box" style="width: 1550px; height:750px; font-family:  pretendard; margin-left: -70px"> <!-- 각자 원하는데로 사용 -->
	
		<label style="position: absolute; top: 40px; left: 20px; font-size: 20px">상품명 : </label><textarea  id="goodsName" name="goodsName"  style="position: absolute; top: 43px; left: 90px; height: 30px; width:260px"><%=pVO.getGoodsName() %></textarea>
		
		<label style="position: absolute; top: 40px; left: 380px; font-size: 20px">상품코드 : </label><textarea id="goodsCode" name="goodsCode" style="position: absolute; top: 43px; left: 470px; height: 30px; width:150px"><%=gcode %></textarea>
		<label style="position: absolute; top: 100px; left: 20px; font-size: 20px">상세정보</label>
		<!-- <div id="tmi" style="border: 1px solid #333; width: 630px ; height: 370px; position: relative; top: 140px; left: 20px  "></div> -->
		<textarea id="tmi" name="tmi" style="border: 1px solid #333; width: 630px ; height: 185px; position: relative; top: 140px; left: 20px "><%=pVO.getTmi() %></textarea>
		<textarea id="engTmi" name="engTmi" style="border: 1px solid #333; width: 630px ; height: 185px; position: absolute; top: 320px; left: 20px  "><%=pVO.getEngTmi() %></textarea>
		
		
		<div id="note"style="border: 0px solid #333; width: 630px ; height: 130px; position: relative; top: 340px; left: 20px">
			<label style="margin-left: 20px">topnote</label><br><textarea id="top" name="top" style="border: 1px solid #333; margin-left: 20px; height: 80px"><%=pVO.getTop() %></textarea>
				<label style="position: absolute; top: 0px; left: 220px" >heart</label><textarea id="heart" name="heart" style="border: 1px solid #333; height: 80px; position: absolute; top: 23px; left: 220px" ><%=pVO.getHeart() %></textarea>
					<label style="position: absolute; top: 0px; left: 420px">base</label><br><textarea id="base" name="base"  style="border: 1px solid #333; height: 80px;  position: absolute; top: 23px; left: 420px"><%=pVO.getBase() %></textarea>
		</div>
		
		<div style="position: absolute; top: 40px; left: 680px; border: 1px solid #333; width: 400px; height: 400px"><img id="previewMainImg"  src="../upload/goods/${product.mainImg eq null ? 'img_null.png' : product.mainImg}" style="width:400px ;height:400px ;" id="mainImg__div" name="mainImg__div"></div>
		<input type="file" id="mainImg" name="mainImg"  class="inputBox" style="position: absolute; top: 460px; left: 680px;">
		<div  style="position: absolute; top: 40px; left: 1100px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewImg1" name="previewImg1"  src="../upload/goods/${product.img1 eq null ? 'img_null.png' : product.img1}" style="width:160px ;height:160px"></div>
	 <input type="file" id="img1" name="img1"  class="inputBox" style="position: absolute; top: 210px; left: 1100px;">
		
	 <div style="position: absolute; top: 40px; left: 1320px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewImg2"  src="../upload/goods/${product.img2 eq null ? 'img_null.png': product.img2}" style="width:160px ;height:160px"></div>
		<input type="file" id="img2" name="img2"  class="inputBox" style="position: absolute; top: 210px; left: 1320px;">
	 
		<div style="position: absolute; top: 280px; left: 1100px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewImg3" src="../upload/goods/${product.img3 eq null ? 'img_null.png' : product.img3}" style="width:160px ;height:160px"></div>
		<input type="file" id="img3" name="img3"  class="inputBox" style="position: absolute; top: 460px; left: 1100px;">
		
		<div style="position: absolute; top: 280px; left: 1320px; border: 1px solid #333; width: 160px; height: 160px"><img id="previewDetailImg"  src="../upload/goods/${product.detailImg eq null ? 'img_null.png' : product.detailImg }" style="width:160px ;height:160px"></div>
		<input type="file" id="detailImg" name="detailImg"  class="inputBox" style="position: absolute; top: 460px; left: 1320px;">
		 
		<button type="button"  id="btnImgSubmit" name="btnImgSubmit" style="position: absolute; top: 550px; left:1320px;  width:120px; height: 50px">이미지 업로드</button>
		<button type="button" class="n-btn btn-accent" id="btnUpdate" style="position: absolute; top: 550px; left:1150px;  width:120px; height: 50px">수정</button>
		
		<div  style="position: absolute; top: 550px; left: 680px; border: 0px solid #333; width: 200px; height: 50px; font-size: 20px"><label>가격 </label>  <input type="text" id="price" name="price" style="width: 120px; heigth: 25px;" value="${product.price }"/></div>
		<div  style="position: absolute; top: 550px; left:920px; border: 0px solid #333; width: 200px; height: 50px; font-size: 20px"><label>수량 </label>  <input type="text" id="quantity" name="quantity" style="width: 120px; heigth: 25px;" value="${product.quantity }"/></div>
		<label style="position: absolute; top: 620px; left:700px;" >ingredient : </label><textarea id="ing" name="ing" style="width: 300px ; height: 80px ; position: absolute; top: 620px; left:790px"><%=pVO.getIng() %></textarea>
		<button type="button"  id="btnDelete" name="btnDelete" style="position: absolute; top: 620px; left:1150px;  width:120px; height: 50px">삭제</button>
		 <span id="imgSuccess" style="position: absolute; top: 620px; left:1320px;"></span>
</div>
	</form>	
</div>
	</div>	

</body>
</body>
</html>