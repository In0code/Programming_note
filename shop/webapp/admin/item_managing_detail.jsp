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
button{  background-color: #FFFFFF;
  border: 1px solid #BEBEBE;
  font-size:20px;
  border-radius: 10px;}
</style>
<script type="text/javascript">
$(function(){
	
	//
	
	$("#btnUpdate").click(function(){
		document.frm.action="item_managing_update_frm_process.jsp";
			$("#frm").submit();
	});
	
	

	
	$("#btnDelete").click(function(){
		document.frm.action="item_managing_delete_frm_process.jsp";
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
	String gcode=request.getParameter("gcode");
	try{
		
	pVO= pDAO.selectOneProduct(gcode);
	pageContext.setAttribute("product", pVO);
	}catch(SQLException se ) {
		se.printStackTrace();
	}//
%>




	
	<div id="rightBody" style="height: 1000px">
		<div class="text" id="mainTitle" style="margin-left: -30px">
			<strong>상품 상세 정보</strong>
		</div>
		<form action="" id="frm" name="frm" method="post" style="position:relative; left:30px" >
		<input type="hidden" id="gcode" name="gcode" value="${param.gcode}">
		<div id="background_box" style="width: 1550px; height:750px; font-family:  pretendard; margin-left: -100px"> <!-- 각자 원하는데로 사용 -->
	
		<label style="position: absolute; top: 40px; left: 20px; font-size: 20px">상품명 : </label><textarea  id="goodsName" name="goodsName"  style="position: absolute; top: 43px; left: 90px; height: 30px; width:260px; border-width: 0 0 1px;"  placeholder="추가 정보를 입력해주세요" ><c:out value="${product.goodsName eq 'null' ? '' : product.goodsName}" /></textarea>
		
		<label style="position: absolute; top: 40px; left: 380px; font-size: 20px">상품코드 : </label><textarea id="goodsCode" name="goodsCode" style="position: absolute; top: 43px; left: 470px; height: 30px; width:150px;  border-width: 0 0 1px;"><%=gcode %></textarea>
		<label style="position: absolute; top: 100px; left: 20px; font-size: 20px">상세정보</label>
		<!-- <div id="tmi" style="border: 1px solid #333; width: 630px ; height: 370px; position: relative; top: 140px; left: 20px  "></div> -->
		<textarea id="tmi" name="tmi" style="border: 1px solid #333; width: 630px ; height: 185px; position: relative; top: 140px; left: 20px "><%=pVO.getTmi() %></textarea>
		<textarea id="engTmi" name="engTmi" style="border: 1px solid #333; width: 630px ; height: 185px; position: absolute; top: 320px; left: 20px  "  placeholder="상세 정보(영문)를 입력해주세요"><c:out value="${product.engTmi eq 'null' ? '' : product.engTmi}" /></textarea>
		
		
		<div id="note"style="border: 0px solid #333; width: 630px ; height: 130px; position: relative; top: 340px; left: 20px">
			<label style="margin-left: 20px">topnote</label><br><textarea id="top" name="top" style="border: 1px solid #333; margin-left: 20px; height: 80px"  placeholder="추가 정보를 입력해주세요"><c:out value="${product.top eq 'null' ? '' : product.top}" /></textarea>
				<label style="position: absolute; top: 0px; left: 220px" >heart</label><textarea id="heart" name="heart" style="border: 1px solid #333; height: 80px; position: absolute; top: 23px; left: 220px" placeholder="추가 정보를 입력해주세요"><c:out value="${product.heart eq 'null' ? '' : product.heart}" /></textarea>
					<label style="position: absolute; top: 0px; left: 420px">base</label><br><textarea id="base" name="base"  style="border: 1px solid #333; height: 80px;  position: absolute; top: 23px; left: 420px"  placeholder="추가 정보를 입력해주세요"><c:out value="${product.base eq 'null' ? '' : product.base}" /></textarea>
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
		 
		<button type="button" id="btnImgSubmit" name="btnImgSubmit" style="position: absolute; top: 550px; left:1320px;  width:150px; height: 50px">이미지 업로드</button>
		<button type="button" id="btnUpdate" style="position: absolute; top: 550px; left:1150px;  width:120px; height: 50px">수정</button>
		
		<div  style="position: absolute; top: 550px; left: 680px; border: 0px solid #333; width: 200px; height: 50px; font-size: 20px"><label>가격 </label>  <input type="text" id="price" name="price" style="width: 120px; heigth: 25px; border-width: 0 0 1px;" value="${product.price eq 0 or product.price eq '0'  ? '' : product.price  }"/></div>
		<div  style="position: absolute; top: 550px; left:920px; border: 0px solid #333; width: 200px; height: 50px; font-size: 20px"><label>수량 </label>  <input type="text" id="quantity" name="quantity" style="width: 120px; heigth: 25px; border-width: 0 0 1px;" value="${product.quantity  eq 0 or product.quantity eq '0'  ? '' : product.quantity }"/></div>
		<label style="position: absolute; top: 620px; left:700px;" >ingredient : </label><textarea id="ing" name="ing" style="width: 300px ; height: 80px ; position: absolute; top: 620px; left:790px" placeholder="추가 정보를 입력해주세요"><c:out value="${product.ing eq 'null' ? '' : product.ing}" /></textarea>
		<button type="button" id="btnDelete" name="btnDelete" style="position: absolute; top: 620px; left:1150px;  width:120px; height: 50px">삭제</button>
		 <span id="imgSuccess" style="position: absolute; top: 620px; left:1320px;"></span>
</div>
	</form>	
</div>
	
</body>
</body>
</html>