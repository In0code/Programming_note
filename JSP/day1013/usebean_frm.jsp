<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		//입력값에 대한 유효성 검증
		$("#frm").submit();
	});//click
});//ready
</script>

</head>
<body>
		<div class="writeForm">
		<form action="usebean_frm_process.jsp" name="frm" id="frm" method="post">
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input data-value="아이디를 입력해주세요." name="id" id="id" class="inputTxt inputIdtype" type="text" maxlength="20"  />
					</td>
				</tr>
				<tr>
					<th><label for="password">비밀번호</label></th>
					<td>
						<input data-value="비밀번호를 입력해주세요." name="password" id="password" class="inputPass size02" type="password"  />
					</td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input data-value="이름을 입력해주세요." id="name" name="name" class="inputTxt inputName" type="text"  />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">생일</label></th>
					<td >
						<input type="text" name="birthday" id="birthday" data-value="생년월일을 입력해 주세요."/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="tel" id="tel"  />
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="text" name="cell" id="cell" />
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td class="mail_type">
						<input data-value="이메일을 입력해주세요." name="email1" id="email1" class="inputEmail" type="text" maxlength="100"  /><span class="email_txt">@</span>
						<select class="selecEmail" name="email2" id="email2" data-value="이메일을 선택해주세요.">
							<option value='naver.com'   >naver.com</option><option value='daum.net'   >daum.net</option><option value='gmail.com'   >gmail.com</option><option value='hotmail.com'   >hotmail.com</option><option value='nate.com'   >nate.com</option><option value='korea.com'   >korea.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="gender">성별</label></th>
 					<td> 
						<input data-value="성별을 선택하세요." name="gender" type="radio" id="radio_check01" value="1" /><label for="radio_check01">남자</label>
 						<input name="gender" type="radio" id="radio_check02"  value="2"/><label for="radio_check02">여자</label>
 					</td> 
				</tr> 
				<tr>
					<th><label for="area">소재지</label></th>
					<td>
						<select id="area" name="area">
							<option value="">선택해주세요.</option>
							<option value='1' >강원</option><option value='2' >경기</option><option value='3' >경남</option><option value='4' >경북</option><option value='5' >광주</option><option value='6' >대구</option><option value='7' >대전</option><option value='8' >부산</option><option value='9' >서울</option><option value='10' >울산</option><option value='11' >인천</option><option value='12' >전남</option><option value='13' >전북</option><option value='14' >제주</option><option value='15' >충남</option><option value='16' >충북</option><option value='17' >해외</option>
						</select>
<!-- 						<input  id="area" name="area" class="inputTxt inputName" type="text" /> -->
					</td>
				</tr>
				<tr>
					<th><label for="zipcode">우편번호</label></th>
					<td>
						<input data-value="우편번호를 입력해주세요." type="text" class="zipcode" id="zipcode" name="zipcode" value=""/>
					</td>
				</tr>
				<tr>
					<th><label for="addr0">주소</label></th>
					<td class="addr_td">
						<input data-value="주소를 입력해주세요." type="text" id="addr0" class="addr" name="addr0" /><br />
						<input data-value="상세주소를 입력해주세요." type="text" id="addr1" class="addr" name="addr1" value="" style="margin-top:7px;"  />
					</td>
				</tr>
				<tr>
					<td>관심언어</td>
					<td>
					<input type="checkbox" value="java" name="lang"/>java
					<input type="checkbox" value="C/C++" name="lang"/>C/C++
					<input type="checkbox" value="PyThon" name="lang"/>PyThon
					<input type="checkbox" value="JSP" name="lang"/>JSP
					<input type="checkbox" value="ASP" name="lang"/>ASP
					</td>
				</tr>
			</table>
			<input type="button" value="가입" class="btn btn-success" id="btn" />
			<input type="reset" value="초기화" class="btn btn-info" />
		</form>
		</div>
</body>
</html>