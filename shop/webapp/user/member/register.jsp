<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info="회원가입"%>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <style type="text/css">
/* 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다. */
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

/* 각 행의 간격을 조절합니다. */
table tr {
	margin-bottom: 10px;
}

/* 입력 폼과 버튼의 간격을 조절합니다. */
table td input, table td select, table td button { 
	margin-bottom: 5px;
}
</style>
<script type="text/javascript">
$(function(){
	
	$("#btnDup").click(function(){
		var id=$("#id").val();
		window.open("id_check.jsp?id="+id,"id_check","width=512,height=313,top="
	            +( window.screenY+150)+",left="+( window.screenX+900));	
	}); 
	
	$("#btnZipcode").click(function(){
		searchZipcode();
	});
	

	$("#btn").click(function(){
		//입력값에 대한 유효성 검증
		if($("#idDupFlag").val() == 0){
			alert($("#id").val()+"은 중복확인 되지 않은 아이디 입니다.\n중복확인을 수행해 주세요.");
			return;
		}//end if
		
		$("#frm").submit();
	});//click	
	
	$("#id").keydown(function(){
		$("#idDupFlag").val(0);
	});
	
});//ready

</script>

</head>
<body>
<%@ include file="../layout/header.jsp"%>
<div id="wrap">
<br> <br> <b><font size="3" color="gray">회원가입</font></b> <br><br>

<form action="register_process.jsp" name="frm" id="frm" method="post">
	<table>
		<tr>
			<td id="title">아이디</td>
			<td>
			<input type="text" name="id" id="id" maxlength="16"> 
			<input type="button"  value="중복확인" id="btnDup"  class="btn btn-secondary btn-sm" > 
			<input type="hidden" name="idDupFlag" value="idDupFlag" />
			</td>
		</tr>

		<tr>
			<td id="title">비밀번호</td>
			<td>
			<input type="password" id="pass" name="pass" maxlength="15">
			</td>
		</tr>

		<tr>
			<td id="title">비밀번호 확인</td>
			<td><input type="password" id="pass2" name="pass2" maxlength="15"></td>
		</tr>

		<tr>
			<td id="title">이름</td>
			<td><input type="text" id="name" name="name" maxlength="10"></td>
		</tr>

		<tr>
			<td id="title">이메일</td>
			<td><input type="text" id="email" name="email" maxlength="30"></td>
		</tr>

		<tr>
			<td id="title">휴대전화</td>
			<td><input type="text" id="phone" name="phone" maxlength="11" placeholder="' - ' 없이 입력"/></td>
		</tr>
				
		<tr>
			<td id="title">주소</td>
			<td>
			<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly="readonly">
			<input type="button" id="btnZipcode" class="btn btn-secondary btn-sm" value="우편번호 찾기"><br>
			<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" style="width:318px"><br>
			<input type="text" id="detailAddr" name="detailAddr" placeholder="상세주소" style="width:318px">
			</td>
		</tr>
	</table>
		<div class="ec-base-button gBottom">
			<input type="button" value="회원가입" id="btn" class="btnSubmits sizeM btn"/>
		</div>
	</form>
</div>

<%@ include file="../layout/footer.jsp" %>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function searchZipcode() {
        new daum.Postcode({
        	width: '500px', // 원하는 가로 크기
            height: '555px', // 원하는 세로 크기
           	top: 90,
           	left: 290,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
           		 
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
                
            }
        }).open();
    }
</script>
</html>    