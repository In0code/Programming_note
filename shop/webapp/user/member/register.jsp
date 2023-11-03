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
	margin-top:80px;
	text-align: center;
}

/* 각 행의 간격을 조절합니다. */
table tr {
	margin-bottom: 1px;
}

/* 입력 폼과 버튼의 간격을 조절합니다. */
table td input, table td select, table td button { 
	margin-bottom: 15px;
}
#sJoin{
	margin-bottom:50px;
	margin-top:30px;
	font-weight: bold;
	font-size: 15px
}
#s_result {
    display: inline-block;
    width: 100%;
    text-align: left;
    position: absolute;
    top: 182;
    left: 320;
    margin-top: 2px; /* 상단 여백을 조절합니다. 필요에 따라 조절하세요. */
    margin-left: 5px; /* 좌측 여백을 조절합니다. 필요에 따라 조절하세요. */
}

</style>
<script type="text/javascript">
$(function(){
	//$("#idDupFlag").val(0);
	$("#btnDup").click(function(){
		var id=$("#id").val();
		window.open("id_check.jsp?id="+id,"id_check","width=510,height=320,top="
	            +( window.screenY+150)+",left="+( window.screenX+900));	
	}); 
	
	$("#btnZipcode").click(function(){
		searchZipcode();
	});
	
	 $("#id").on('input', function() {
	        var id = $(this).val();
	        var regex = /^[a-z0-9]*$/; // 영문(소문자)과 숫자만 허용
	        if (!regex.test(id)) {
	            alert("영문(소문자)과 숫자만 입력 가능합니다.");
	            $(this).val(""); // 입력한 값 비움
	            return;
	        }
	    });
	 
	
	$("#btn").click(function(){
        // 필수 입력 필드가 비어있는지 확인
        var id = $("#id").val();
        var pass = $("#pass").val();
        var pass2 = $("#pass2").val();
        var name = $("#name").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var zipcode = $("#zipcode").val();
        var addr = $("#addr").val();
        var detailAddr = $("#detailAddr").val();
        
        if( pass == "" || pass2 == "" || name == "" || email == "" || phone == "" || zipcode == "" || addr == "" || detailAddr == ""){
            alert("모든 항목을 입력해주세요.");
            return;
        }
        
        if($("#idDupFlag").val() == 0){
			alert("아이디 중복확인을 해주세요.");
			return;
		}//end if
		
		//비밀번호 불일치했을때 알림팝업
		if (!compare_result()) {
			alert('비밀번호가 일치하지 않습니다.');
			return; 
		}
		
		// 아이디와 비밀번호가 같은지 확인
	    if (id === pass) {
	        alert('아이디와 비밀번호는 같을 수 없습니다');
	        return;
	    }
		
        // 입력값에 대한 유효성 검증을 통과했을 때
        $("#frm").submit();
    });//click
    
	$("#id").keydown(function(){
		$("#idDupFlag").val(0);
	});
    
	$("#pass, #pass2").on('input', function() {
		compare_result();
	});
	
});//ready

function compare_result() {
	var pw1 = $("#pass").val();
	var pw2 = $("#pass2").val();
	var $s_result = $("#s_result");

	if (pw1 === pw2 && pw1 !== "" && pw2 !== "") {
		$s_result.text("비밀번호가 일치합니다.");
		$s_result.css("color", "teal");
		return true;
	}

	$s_result.text("비밀번호가 일치하지 않습니다.");
	$s_result.css("color", "red");
	return false;
}

</script>

</head>
<body>
<%@ include file="../layout/header.jsp"%>
<div id="wrap">
<div id="sJoin">회원가입</div>
<form action="register_process.jsp" name="frm" id="frm" method="post">
	<table>
		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">아이디</td>
			<td>
			<input type="text" name="id" id="id" maxlength="16" style="height:35px"> 
			<input type="button"  value="중복확인" id="btnDup"  class="btn btn-secondary btn-sm" > 
			<input type="hidden" name="idDupFlag" id="idDupFlag"/>
			</td>
		</tr>

		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">비밀번호</td>
			<td>
			<input type="password" id="pass" name="pass" maxlength="15" style="height:35px">
			</td>
		</tr>

		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">비밀번호 확인</td>
			<td><input type="password" id="pass2" name="pass2" maxlength="15" style="height:35px">
			<span id="s_result" style="font-size: 9px"></span></td>
		</tr>

		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">이름</td>
			<td><input type="text" id="name" name="name" maxlength="10" style="height:35px"></td>
		</tr>

		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">이메일</td>
			<td><input type="text" id="email" name="email" maxlength="30" style="height:35px"></td>
		</tr>

		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">휴대전화</td>
			<td><input type="text" id="phone" name="phone" maxlength="11" style="height:35px" placeholder="' - ' 없이 입력"/></td>
		</tr>
				
		<tr>
			<td id="title" style="font-size:15px; padding:5px 20px;">주소</td>
			<td>
			<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" readonly="readonly" style="height:35px">
			<input type="button" id="btnZipcode" class="btn btn-secondary btn-sm" value="우편번호 찾기"><br>
			<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" style="width:318px; height:35px"><br>
			<input type="text" id="detailAddr" name="detailAddr" placeholder="상세주소" style="width:318px; height:35px">
			</td>
		</tr>
	</table>
		<div class="ec-base-button gBottom">
			<input type="button" value="회원가입" id="btn" class="btnSubmits sizeM btn" 
			style="font-size:15px; padding:5px; color: white; width:450px; margin-right:20px; margin-bottom:100px; margin-top:-30px "/>
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