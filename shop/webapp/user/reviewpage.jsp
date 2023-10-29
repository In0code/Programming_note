<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=3, user-scalable=yes">

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
</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>

<body>

 <%@ include file="layout/header.jsp" %> 


<!-- <section class="mypage-cont" style="  position:relative; top:10px;left:0px; font-family: musinsa;"> -->
            <form id="reviewForm" name="reviewForm" method="post" style="position:relative; left:30px">
                <input type="hidden" name="tmpcode" value="1697704836038">
                <input type="hidden" name="imageCount" value="0">
                <input type="hidden" name="opt_kind_cd" id="optKindCode" value="BEAUTY">

                
    <header class="n-section-title">
        <h1 class="tit">후기 작성</h1>
    </header>

    <ul class="n-info-txt">
    	<br/>
        <li>작성하신 후기는 Cherie 및 Cherie 글로벌 이용자에게 공개됩니다. </li>
        <li>후기 내용은 20자 이상 작성합니다.</li>
        <li>
            아래에 해당할 경우 일부 후기는 조건에 따라 비노출 처리 됩니다.
            <br>- 문자 및 기호의 단순 나열, 반복된 내용의 후기
            <br>- 주문하신 상품과 관련 없는 내용의 후기
            <br>- 개인정보 및 광고, 비속어가 포함된 내용의 후기
        </li>
        
        
            
            <li>원활한 서비스 이용을 위해 후기 도용 시 일부 Cherie 서비스 이용에 제한이 발생될 수 있습니다.</li>
        
    </ul>


                <div class="my-review-write" id="reviewWrap" style="max-width: 1850px">
                    <!-- 상품 -->
                    <div class="n-prd-row">
                        <a href="/app/goods/2027866" class="img-block">
                            <img src="//image.msscdn.net/images/goods_img/20210713/2027866/2027866_16974232192040_100.jpg" alt="레플리카 바이 더 파이어플레이스 EDT 100ML">
                        </a>
                        <ul class="info">
                            <li class="brand"><a href="//www.musinsa.com/brands/maisonmargielaperfume">메종 마르지엘라 퍼퓸</a></li>
                            <li class="name"><a href="/app/goods/2027866">레플리카 바이 더 파이어플레이스 EDT 100ML</a></li>
                            <li class="option">FREE</li>
                            
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
                                <div class="tab-block is-active" data-tab="text">
                                    <textarea id="goods_text" style="width:1000px" placeholder="다른 회원분에게 도움이 되는 나만의 팁을 소개해 주세요. (20자 이상 작성)" name="goods_text"></textarea>
                                    <p class="info" id="text_size">0 자 / 20자 이상</p>
                                </div>
                            </div>
                        </div>
                        <!-- //입력 영역 -->
                        <!-- 사진 첨부 -->
                        
                        <!-- //사진 첨부 -->
                    </div>
                    <!-- //후기 작성 -->

                 

                    <div class="n-btn-group">
                        <button type="button" class="n-btn btn-accent" id="btnSave">등록</button>
                    </div>
                </div>
            </form>
<!--         </section> -->

<footer><%@ include file="postingfooter.jsp" %> </footer> 

</body>
</html>