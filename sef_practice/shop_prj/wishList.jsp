<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <jsp:include page="cdn.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet"/>

<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2310111247" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://www.afterblow-scent.com//ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://www.afterblow-scent.com//ind-script/optimizer_user.php?filename=tZVRTkQhDEX_B39dRxPjQkxcQSmdRzNACYVRdy_RiS7gwSe0OaWXcoGomYHJDeNmgNfOzSf9gDp8EnKx5wQW2AU2OQrYTcorkBlkDSMxeMUWIIn1N6QbHvw0g8-wBmuMjeJKImHnrPelp7yOQl20nGAm_NLRwaMJ_RQgzXkt8XdjJZHpMhd8GbKD2lVTl7oDHTlt4dY2x4K2aFzxkDJnd4vS6Hdg_eh97Qj_kfVzkw5pi8Azi04aTuCOkpZAXk5S0M8uXdU6tjyiGeC2xp4fNfKYRmJR63uUWqUcS-mk5T4B0__r2UuOjOF07w8Tcv9_5zc&type=css&k=1cf7bf9104f439c2319ffe078ce73e719637e27b&t=1641537240&user=T"  />
<style type="text/css">

a.btnBlack.left.sizeL {
/* Font & Text */
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
font-size: 14px;
line-height: 22px;
text-decoration: none solid rgb(255, 255, 255);
text-align: center;
vertical-align: middle;
white-space: nowrap;
word-spacing: 0px;
/* Color & Background */
background-color:  #000000;
background-position: 0% 0%;
color:  #FFFFFF;
/* Box */
height: 56px;
width: 582px;
border: 1px solid  #FFFFFF;
padding: 16px 16px 16px 16px;
min-width: 80px;
/* Positioning */
float: left;
display: block;
/* Miscellaneous */
cursor: pointer;
/* Effects */
transform: none;
transition: all 0.3s ease-in-out 0s;
outline: rgb(255, 255, 255) dashed 0px;
box-sizing: border-box;

}
a.btnSubmit.right.sizeL {
/* Font & Text */
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
font-size: 14px;
line-height: 22px;
text-decoration: none solid rgb(0, 0, 0);
text-align: center;
vertical-align: middle;
white-space: nowrap;
word-spacing: 0px;
/* Color & Background */
background-color:  #FFFFFF;
background-position: 0% 0%;
color:  #000000;
/* Box */
height: 56px;
width: 582px;
border: 1px solid  #000000;
padding: 16px 16px 16px 16px;
min-width: 80px;
/* Positioning */
float: left;
display: block;
/* Miscellaneous */
cursor: pointer;
/* Effects */
transform: none;
transition: all 0.3s ease-in-out 0s;
outline: rgb(0, 0, 0) dashed 0px;
box-sizing: border-box;
}

</style>

<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
 <%@include file="header.jsp" %>
<div id="container">
<div id="contents">

<div class="titleArea">
  <h2>관심상품</h2>
</div>

<div class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList xans-record-"><!--
        $login_page = /member/login.html
        $count = 10
    -->
<table border="1" summary="" class="displaynone">
<caption>관심상품 목록</caption>
        <colgroup>
<col style="width:27px;">
<col style="width:92px">
<col style="width:auto">
<col style="width:105px">
<col style="width:100px">
<col style="width:100px">
<col style="width:85px">
<col style="width:105px">
<col style="width:110px">
</colgroup>
<thead><tr>
<th scope="col"><input type="checkbox" onclick="NewWishlist.checkAll(this);"></th>
                <th scope="col">이미지</th>
                <th scope="col">상품정보</th>
                <th scope="col">판매가</th>
                <th scope="col">적립금</th>
                <th scope="col">배송구분</th>
                <th scope="col">배송비</th>
                <th scope="col">합계</th>
                <th scope="col">선택</th>
            </tr></thead></table>
<p class="message ">관심상품 내역이 없습니다.</p>
</div>

<div class="xans-element- xans-order xans-order-totalorder ec-base-button 100per "><ul class="grid2">
<a href="#none" class="btnBlack left sizeL" onclick="Basket.orderAll(this)">전체상품주문</a>
        <a href="#none" class="btnSubmit  right sizeL" onclick="">관심상품 비우기</a>
        </ul>
</div>

</div>   
</div>
<%@include file="footer.jsp" %>
</body>
</html>