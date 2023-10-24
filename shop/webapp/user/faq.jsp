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

</style>

<script type="text/javascript">
$(function() {
	
	
});//ready
</script>

</head>
<body>
<%@ include file="layout/header.jsp"%>
<div id="pageTitle">FAQ</div><br>

<div class="accordion" id="accordionExample" style="width:60%; height:100%; margin:0px auto">
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
            [배송문의] 주문한 상품 배송은 얼마나 걸리나요?
          </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px">
			당일 오후 1시 이전 결제 완료건에 한하여 <br>
			주문일로부터 영업일 기준 1~2일 내 출고 진행 됩니다. <br> 
			주말 / 공휴일 / 명절 연휴가 포함되거나 주문 폭주 및 택배사의 사정 등으로 인한 경우 배송이 지연될 수 있습니다.           
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            [배송문의] 택배사 및 배송비는 얼마인가요?
          </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			'우체국 택배'를 통해 안전하게 배송됩니다. <br>
			배송비는 2,500원입니다.            
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            [배송문의] 송장번호 문자를 받았는데 배송조회가 되지 않아요.
          </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			배송문자 발송 시점과 택배사에서 출고 제품 인계 시점이 다를 수 있기 때문에 <br>
			정확한 배송 조회는 오후 9시 이후 또는 다음날 조회해 주시기 바랍니다.          
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
            [배송문의] 따로 주문했는데 합배송 되나요?
          </button>
        </h2>
        <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			주문번호가 다를 경우 각각 별도 배송되며, <br>
			1개의 주문건이라 하더라도 주문량이 많을 경우 나눠서 배송될 수 있는 점 참고해주시기 바랍니다.           
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
            [교환/환불문의] 향이 마음에 들지 않는데 반품할 수 있나요?
          </button>
        </h2>
        <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			제품 구입 후 7일 이내 개봉하지 않은 '정상 제품'에 한하여 <br>
			구매 내역 확인 후 교환/반품 가능합니다.           
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
            [교환/환불문의] 교환 또는 반품 시 택배비는 얼마인가요?
          </button>
        </h2>
        <div id="collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			배송 후 단순변심에 의한 취소 및 교환의 경우 <br>
			배송비를 모두 부담해야하며, 미개봉 상태로만 가능합니다. <br>
			- 단순반품 : 5,000원 <br>
			- 왕복교환 : 5,000원           
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
            [교환/환불문의] 교환/반품 접수는 어떻게 하나요?
          </button>
        </h2>
        <div id="collapseSeven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			아래 2가지 방법 중 하나로 접수해주시면 됩니다. <br>
			1) 카카오톡 고객센터에서 <br>
			채팅 URL : http://pf.kakao.com/_cHerI/chat <br>
			[주문자명 / 주문번호 / 연락처 / 접수내용] <br>
			남겨주시면 확인 후 순차적으로 처리해드립니다. <br><br>

			2) Chérie 고객센터 1660-0908 <br>
 			Mon-Fri : 9:00 - 11:30 / 13:00 - 17:30 <br>
			Weekend Holiday OFF            
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
            [주문/결제문의] 적립금 및 쿠폰을 사용해서 주문했는데 주문 취소 시 복구 되나요?
          </button>
        </h2>
        <div id="collapseEight" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			주문취소 시 사용하신 쿠폰 및 적립금은 정상 복구 됩니다.             
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
            [상품문의] 핸드크림은 손 외에 다른 곳에 사용해도 되나요?
          </button>
        </h2>
        <div id="collapseNine" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			코코넛야자오일, 아비시니안케일씨오일 등 자연 유래 성분을 활용하였기 때문에 <br>
			피부 장벽 강화 및 수분 케어에 도움을 줄 수 있습니다. <br>
			손 외에 몸의 일부, 헤어에도 활용이 가능하지만,  <br>
			민감성 피부의 경우 전문의와의 상담 후 사용하시길 권해드립니다.            
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
            [상품문의] 향수는 손목, 귀 뒤쪽 외에 다른 곳에 사용해도 되나요?
          </button>
        </h2>
        <div id="collapseTen" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			일반적으로 향수의 경우 맥박이 뛰는 곳, <br>
			움직임이 많은 곳 (손목, 귀 뒤, 목 등)에 뿌리기를 권장 드리고 있습니다. <br>
			더 짙고 오랜 향을 원하실 경우 헤어, 의류 등 사용 가능하시며 <br>
			거리를 두고 분사하여 넓은 부위에 뿌려질 수 있도록 사용하시기를 추천드립니다.            
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
            [상품문의] 향수 지속 시간은 어느정도인가요?
          </button>
        </h2>
        <div id="collapseEleven" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			진한 퍼퓸과 가벼운 느낌의 오드 뚜왈렛의 중간정도로, <br>
			향기의 지속 시간은 5시간 전 후 입니다. <br>
			다만 사용 횟수, 사용 방법 및 상황에 따라 개인차가 있을 수 있으며 <br>
			동일 향의 핸드크림과 사용 시 보다 오래 향이 지속 될 수 있습니다.       
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
            [상품문의] 시중에 판매되는 향과 무엇이 다른가요?
          </button>
        </h2>
        <div id="collapseTwelve" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			Chérie의 향은 세계적인 조향사가 직접 제조한 향으로 <br>
			보다 짙고 매력적인 향을 내기 위해 제조 후 일정 기간 동안 숙성 기간을 거칩니다. <br>
			동일한 무드의 향 보다는 잔향과 어우러졌을 때 나만의 유니크한 향을 경험할 수 있습니다.      
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
            [상품문의] 핸드워시는 바디워시 겸용으로 사용해도 되나요?
          </button>
        </h2>
        <div id="collapseThirteen" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			천연 계면 활성제를 활용하여 바디워시 겸용으로 사용해도 괜찮으나 <br>
			민감성 피부일 경우 전문의와 상담 후 사용하시기를 권장 드립니다.     
		  </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button style="font-family: Pretendard Medium" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
            [상품문의] 향수는 어떻게 보관 해야 할까요?
          </button>
        </h2>
        <div id="collapseFourteen" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
          <div class="accordion-body" style="font-family: Pretendard Medium; font-size: 15px" >
			향수는 알코올 성분으로 열과 직사광선에 민감하기 때문에 <br>
			어둡고 서늘한 곳에 보관합니다. 특히 온도 변화가 급격한 욕실, 자동차 실내 등 향수 보관은 피해주시기 바랍니다. <br>
			* 너무 저온에 보관할 경우 원액과 결정이 분리 될 수 있습니다.     
		  </div>
        </div>
      </div>
    </div>

<%@ include file="layout/footer.jsp"%>
</body>
</html>