<%@page import="java.sql.SQLException"%>
<%@page import="member.vo.RegisterVO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ empty sesId }">
<c:redirect url="login.jsp"/>
</c:if>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost/prj_web_shopping/user/member/mypage.css" />
<link rel="stylesheet" type="text/css"
href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<style type="text/css">
#Header {
    position: relative;
    width: 100%;
    font-size: 16px;
    padding: 30px;
    background: #fff;
    border-bottom: 1px solid #fff;
    z-index: 99;
    z-index: 99;
}
#Footer {
    position: relative;
    padding: 100px 0 120px 0;
    margin-top: 100px;
    border-top: 1px solid #fff;
    background: #fff;
    z-index: 90;
}

th {
	font-size: 16px;
}

</style>
<script type="text/javascript">
$(function() {
	
	$("#pass").on('input', function() {
        var id = $(this).val();
        var regex = /^[a-z0-9]*$/; // 영문자와 숫자만 허용
        if (!regex.test(id)) {
            alert("영문(소문자)과 숫자만 입력 가능합니다.");
            $(this).val(""); // 입력한 값 비움
            return;
        }
    });

	$("#btnZipcode").click(function(){
		searchZipcode();
	});	
	
	$("#btn").click(function(){
        // 필수 입력 필드가 비어있는지 확인
         var id = $("#id").val();
        var pass = $("#pass").val();
        var pass2 = $("#pass2").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var zipcode = $("#zipcode").val();
        var addr = $("#addr").val();
        var detailAddr = $("#detailAddr").val();
        
        if( pass == "" || pass2 == "" ||  email == "" || phone == "" || zipcode == "" || addr == "" || detailAddr == ""){
            alert("모든 항목을 입력해주세요.");
            return;
        }
		
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
		
        // 입력값에 대한 유효성 검증을 통과했을 때, 정보수정 처리
        $("#frm").submit();
    });//click
    
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
<%
//한글처리
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("sesId");
if(id == null || "".equals(id)){
	System.out.println((String)session.getAttribute("sesId"));
	response.sendRedirect("login.jsp");
	return;
}//end if

MemberDAO mDAO=MemberDAO.getInstance();
try{
	RegisterVO rVO=mDAO.selectInfo(id);
	pageContext.setAttribute("member", rVO);
	
}catch(SQLException se){
	se.printStackTrace();
	response.sendRedirect("main.jsp");
	return;
}
%>

<%@ include file="../layout/header.jsp"%>
<div id="contents">
		<div class="titleArea">
			<h2><big>회원 정보 수정</big></h2>
		</div>

		<h3 class="displaynone ">기본정보</h3>
		<form action="update_info_process.jsp" id="frm" name="frm" method="post">
		<div class="ec-base-table typeList">
			<table border="1" summary="">
				<caption>회원 기본정보</caption>
				<colgroup>
					<col style="width: 180px;">
					<col style="width: auto;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">아이디</th>
						<td><input id="id" name="id" value="${ member.id }" class="inputTypeText"  type="text" readonly="readonly" />
							<p class="info" style="font-size:5px">(영문 소문자/숫자, 4~16자)</p></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td>
								<input id="pass" name="pass"  maxlength="16" value="" type="password">
							<p class="info" style="font-size:5px">(영문 소문자/숫자 조합, 4자~16자)</p>
						</td>
					</tr>
					<tr class="">
						<th scope="row">비밀번호 확인</th>
						<td>
						<input id="pass2" name="pass2"   maxlength="16" value="" type="password">
						<span id="s_result" style="font-size: 8px;"></span>
						</td>
					</tr>

					<tr style="display: 1">
						<th scope="row" id="">이름</th>
						<td><input id="name" name="name"  value="${ member.name }" readonly="readonly" maxlength="20" type="text"></td>
					</tr>
					

					<tr class="">
						<th scope="row">주소</th>
						<td>
						<input type="text" value="${ member.zipcode }" id="zipcode" name="zipcode" style="width:100px; height:29px" placeholder="우편번호" readonly="readonly">
						<input type="button" id="btnZipcode" class="btn btn-secondary btn-sm" 
						style="font-size:5px; width:100px; height:29px" value="우편번호 찾기"><br>
						<input type="text" value="${ member.addr }" id="addr" name="addr" style="width:270px; height:29px" placeholder="주소" readonly="readonly"><br>
						<input type="text" value="${ member.detailAddr }" id="detailAddr" name="detailAddr" style="width:270px; height:29px" placeholder="상세주소">
						</td>
					</tr>

					<tr class="">
						<th scope="row">휴대전화</th>
						<td>
						 <input id="phone" name="phone" value="${ member.phone }" maxlength="11" placeholder="" type="text">
						</td>
					</tr>

					<tr>
						<th scope="row">이메일</th>
						<td>
							<input id="email" name="email" value="${ member.email }" type="text">  
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="ec-base-button 100per">
			<input type="button" id="btn" style="color:white; width:1175px" class="btnSubmits sizeM btn" value="회원정보수정"/>
		</div>
		</form>
</div>


<%@ include file="../layout/footer.jsp"%>
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