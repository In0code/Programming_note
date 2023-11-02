<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >

<title>리뷰 작성</title>
<%-- <jsp:include page="/cdn/cdn.jsp" />
 --%><link rel="icon"
	href="http://192.168.10.142/jsp_prj/common/main/favicon.png">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/platform/css/common.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/magazine_common.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/guide.min.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/layout.min.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/media_query.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/new.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/style.min.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/store_common.css?202310191443">
	<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/sub.css?202310191443">
	<link type="text/css" rel="stylesheet" href="//image.msscdn.net/ui/musinsa/resources/common/css/icon.min.css?202310191443">
<link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/mypage.min.css?202310191443%22"> 
 <link type="text/css" rel="stylesheet" href="https://image.msscdn.net/ui/build/pc/css/mypage.css?202310191443">
  <link type="text/css" rel="stylesheet" href="https://static.msscdn.net/skin/musinsa/css/sub.css?202310191443">
  <link type="text/css" rel="stylesheet" href=" https://static.msscdn.net/skin/musinsa/css/new.css?202310191443">
  
 	<link type="text/css" rel="stylesheet" href="//static.msscdn.net/static/review/js/common/util/img_upload/musinsa.gallery.editor.css?202310191443">
 

 <jsp:include page="../cdn/cdn.jsp"/>    

<!--  common-layout -->




<!-- 후기 외부 style -->




<style type="text/css">
.review-satisfaction-form__radio {display:none; }
#myReviewAgree{display:none; }
#goods_text{width:800px}
.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
input[type="file"] {
     height: 50px; 
   
}
</style>
<script type="text/javascript">
$(function(){
	
	   $("#btnSave").click(function(){
		   
		  $("#frm").submit();
		
	   })//click
	   
	   $('#reviewImg').change(function(){
		 	
		 	  
		 	  var file=event.target.files[0];
		 	  var reader=new FileReader( );
		 	  reader.onload=function(e){
		 		  $("#previewProfile").attr("src",e.target.result);
		 	  }
		 	  
		 	  reader.readAsDataURL(file);
		 	  alert("파일 선택 후 이미지 업로드 버튼을 눌러주세요.")
		  
		   });//change
	   
	   $("#btnImgSubmit").click(function(){
		   //alert($("#reviewImg").val());
   var frm=$("#frm")[0];
		   
		   var formData= new FormData(frm);
		   
		   $.ajax({
			  url:"reviewpage_upload_process.jsp",
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
				  var msg="";
				  if(jsonObj.uploadFlag){
    				  msg= "이미지 업로드 완료";
    			  } else {
    				  msg="이미지 업로드 실패";
    				  alert ("파일을 선택하여 이미지를 첨부해주세요.");
    			  }
    			  
				  $("#imgSuccess").html(msg);
				  $("#rcode").val(jsonObj.SeqRcode);
				  }
		   });//ajax
	   })//click
			   
		   
	$('#review').keyup(function (e) {
		let content = $("#review").val();
	    
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	    	$('.textCount').text('0자');
	    } else {
	    	$('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 200) {
	    	// 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 200));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 200자까지 입력 가능합니다.');
	    };
	});
});//ready
</script>

</head>
<jsp:useBean id="pmVO" class="admin.vo.ProductManageVO" scope="page"/><!-- string party_no2="양승연"+"이동원"+"이승우"+"임태균"+"김인영" --> 
<jsp:setProperty property="*" name="pmVO"/>
<%
UserReviewDAO uDAO= UserReviewDAO.getInstance();

try{
	pmVO = uDAO.selectproductImg("BC0001");//상품클릭 시 받을 값 ,gcode?
	
	pageContext.setAttribute("goods", pmVO);
}catch (SQLException se) {
	se.printStackTrace();
}//end catch
%>
<body>

 <%@ include file="layout/header.jsp" %> 


<!-- <section class="mypage-cont" style="  position:relative; top:10px;left:0px; font-family: musinsa;"> -->
		
   <form action="reviewpage_frm_process.jsp" id="frm" name="frm" method="post" style="position:relative; left:30px" >
            
<input type="hidden"  id="rcode" name="rcode">
                
    <header class="n-section-title">
        <h1 class="tit">후기 작성</h1>
    </header>

    <ul class="n-info-txt">
    	
        <li>작성하신 후기는 Cherie 및 Cherie 글로벌 이용자에게 공개됩니다. </li> 
        <li>
            아래에 해당할 경우 일부 후기는 조건에 따라 비노출 처리 됩니다.
            <br>- 문자 및 기호의 단순 나열, 반복된 내용의 후기
            <br>- 주문하신 상품과 관련 없는 내용의 후기
            <br>- 개인정보 및 광고, 비속어가 포함된 내용의 후기
        </li>
        
        
            
            <li>원활한 서비스 이용을 위해 후기 도용 시 일부 Cherie 서비스 이용에 제한이 발생될 수 있습니다.</li>
        
    </ul>
    <!--  사진업로드 -->
     <button type="button" class="n-btn btn-accent" id="btnImgSubmit" style="position: absolute; top: 490px; left:1600px;  width:20px;">이미지 업로드</button>
     <span id="imgSuccess" style="position: absolute; top: 500px; left:1705px;"></span>
<input type="file" name="reviewImg" id="reviewImg" class="inputBox" style=" margin-left: 1600px; position: absolute; top:445px; ">
				<span id="imgResult"></span>
				
				<label style="position:absolute; left:1430px; font-size:20px; font-family: musinsa;">리뷰사진</label>
				<div style="border: 1px solid #AAAAAA; width:260px; height:286px; position:absolute; top:245px;left:1335px"></div> 

			<img id="previewProfile" src="../upload/review/img_background.png" style="width:250px; height:275px;  position:absolute; top:250px;left:1340px"/>
							

                <div class="my-review-write" id="reviewWrap" style="max-width: 1850px">
                <span id="imgResult"></span>
                
                <img id="previewProfile" src="" style="width:100px;"/>
                
                
                
                



                <div class="my-review-write" id="reviewWrap" style="max-width: 1850px">
                    <!-- 상품 -->
                    <div class="n-prd-row"  >
                  
                        <a href="/app/goods/2027866" class="img-block">
                            <img src="../upload/goods/${goods.mainImg}" />
                             
                        </a>
                      
                        <ul class="info">
                       <!--  <li class="name"><a href="/app/goods/2027866">레플리카 바이 더 파이어플레이스 EDT 100ML</a></li> -->
                            <li class="name"><%=pmVO.getGoodsName() %></li>
                            
                            
                        </ul>
                    </div>
                    <!-- //상품 -->

                    <!-- 별점 -->
	<h3 style="font-family :musinsa;">별점을 매겨주세요</h3><div  style= "margin-left: 10px; margin-top:5px; border: 0px " class="star-rating" >
  <input type="radio" id="5-stars" name="star" value="5"/>
  
  <label for="5-stars" class="star" >&#9733;</label>


  
  <input type="radio" id="4-stars" name="star" value="4" />
  <label for="4-stars" class="star">&#9733; </label>
  
 
  <input type="radio" id="3-stars" name="star" value="3"/>
  <label for="3-stars" class="star">&#9733;</label>

  <input type="radio" id="2-stars" name="star" value="2"/>

  <label for="2-stars" class="star">&#9733;</label>
   
  <input type="radio" id="1-star" name="star" value="1" />
  <label for="1-star" class="star">&#9733;</label>
 <br>
 
  <br>



</div>

                    <!-- //별점 -->

                    <!-- 구매만족도 -->
                 
                    


                    <!-- 후기 작성 -->
                    <div class="review-write--v2">
                        <div class="review-share">
                            <h2>내용</h2>
                        </div>
                        <!-- 입력 영역 -->
                        <div class="n-comment-input tab-wrap is-active">

                            <div class="input-area">
                                <!-- Text -->
                                <div class="tab-block is-active" data-tab="">
                                    <textarea id="review" name="review" style="width:1840px; font-size: 15px" cols='1000' maxlength="200" placeholder="다른 회원분에게 도움이 되는 나만의 팁을 소개해 주세요."> </textarea>
                                    <p class="textCount" id="text_size" style="position:absolute; top: 250px; right:70px; color: #AAAAAA">0 자 </p>
                                    <p class="textTotal" style="position:absolute; top: 250px; right:20px; color: #AAAAAA">/200자</p>
                                </div>
                            </div>
                            
                            
                        </div>
                       
                   
                    </div>
                

                 

                    <div class="n-btn-group">
                        <button type="button" class="n-btn btn-accent" id="btnSave">등록</button>
                    </div>
                </div>
                </div>
            </form>


<footer><%@ include file="postingfooter.jsp" %> </footer> 

</body>
</html>