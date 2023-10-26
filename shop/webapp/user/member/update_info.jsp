<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="https://afterblow-scent.com/ind-script/optimizer.php?filename=nc1LCoAwDIThfXHrOYLeqC3xAU2mpCno7RW8gHQ7zMdPB4RpWY2qYbcoZNzQLTPl1mgzqFOGCHR6h5n-_DmHhtL9hIaEaxB299FoiTfbGPWYCg9S1FBO5ZCi6td_AA&type=css&k=37c9481ac0212340e132f81eba4d1049fee7f18e&t=1681776733" />
<link rel="stylesheet" type="text/css"
href="https://afterblow-scent.com/ind-script/optimizer_user.php?filename=tZRbTkQhDIbfB19dRxPjQkzGDRROPTQHKOGizu7tXHQBAm9cP8oP-cBLJCBneqVSAT8aFRvkC3K3gZ3xLQaoG5mNKu8J6sHpFVyt8IY7vUt-0vYz_JsSZeuBIF6qlwwW02FFjkFoltyziRStbvQ8UmPAi_SmhVV2N7aTGCXNJN4HZhLJnbRDp84rqE0ktLmh_qI9hSXcXPSbuSUZZ9w5YaMlSaNdgbW9tblf-I8s34tyCEsC1lVu0DUbNeQwBfIySEGrtzQ3-a0ISyeozNH944zYVSRX8Z9V0pnTPpXuJH0qgCXl0Uf2hNvw3R8SMpWwOH-F_QA&type=css&k=6d772c65d1f33705cdd1d1e541979b835f286a4d&t=1641537240&user=T" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Shippori+Mincho:wght@400;700&amp;display=swap" rel="stylesheet" />
<style type="text/css">
</style>

<script type="text/javascript">
	$(function() {

	});//ready
</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div id="contents">
		<div class="titleArea">
			<h2>회원 정보 수정</h2>
		</div>

		<h3 class="displaynone ">기본정보</h3>

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
						<td><input id="member_id" name="member_id" class="inputTypeText"  type="text" readonly="readonly" value="test123"/>
							<p class="info" style="font-size:6px">(영문소문자/숫자, 4~16자)</p></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td>
								<input id="passwd" name="passwd"
									fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
									fw-msg="" autocomplete="off" maxlength="16" value="" type="password">
							<p class="info" style="font-size:6px">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</p>
						</td>
					</tr>
					<tr class="">
						<th scope="row">비밀번호 확인</th>
						<td><input id="user_passwd_confirm"
							name="user_passwd_confirm" fw-filter="isFill&amp;isMatch[passwd]"
							fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off"
							maxlength="16" 0="disabled" value="" type="password"> <span
							id="pwConfirmMsg"></span></td>
					</tr>
					
					<tr class="displaynone">
						<th scope="row">새 비밀번호 확인</th>
						<td><input id="new_passwd_confirm" name="new_passwd_confirm"
							fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
							fw-msg="" maxlength="16" 0="disabled" value="" type="password">
							<span id="new_pwConfirmMsg"></span></td>
					</tr>


					<tr style="display: 1">
						<th scope="row" id="">이름</th>
						<td><input id="name" name="name" readonly="readonly" maxlength="20" value="테스트" type="text"></td>
					</tr>
					

					<tr class="">
						<th scope="row">주소</th>
						<td>
						<input type="text" id="sample6_postcode"  style="width:100px; height:29px" placeholder="우편번호" readonly="readonly">
						<input type="button" class="btn btn-secondary btn-sm" style="font-size:5px; width:100px; height:29px"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" name="address" style="width:204px; height:29px" placeholder="주소" readonly="readonly"><br>
						<input type="text" id="sample6_detailAddress" style="width:204px; height:29px" placeholder="상세주소">
						</td>
					</tr>

					<tr class="">
						<th scope="row">휴대전화</th>
						<td>
						 <input id="mobile" name="mobile" maxlength="11" placeholder="" value="01077778888" type="text">
						</td>
					</tr>

					<tr>
						<th scope="row">이메일</th>
						<td>
							<input id="email" name="email" placeholder="" value="test@naver.com" type="text">  
						</td>
					</tr>

				</tbody>
			</table>
		</div>

		<div class="ec-base-button 100per">
			<ul class="grid2">
				<a href="#none" style="color:white; width:1175px" class="btnSubmits sizeM btn" 
				onclick="memberEditAction()">회원정보수정</a>
			</ul>
		</div>

	</div>


	<%@ include file="../layout/footer.jsp"%>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>