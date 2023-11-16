<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="kr.co.sist.domain.WebMemberDomain"%>
<%@page import="day1115.ExamDAO5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.137/jsp_prj/common/main/favicon.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function searchZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr0").value = roadAddr;
                document.getElementById("addr1").focus();
            }
        }).open();
    }
</script>

<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	 $('#info').summernote({
	        placeholder: 'Hello Bootstrap 4',
	        tabsize: 2,
	        height: 100
	   });
	
	$("#btnDup").click(function(){
		var id=$("#id").val();
		window.open("id_dup.jsp?id="+id,"id_dup","width=512,height=313,top="
	            +( window.screenY+150)+",left="+( window.screenX+200));	
	}); 
	
	$("#btnZipcode").click(function(){
		searchZipcode();
	});
	
	$("#btn").click(function(){
		//입력값에 대한 유효성 검증
		if($("#idDupFlag").val() == 0){
			alert($("#id").val()+"은 중복확인 되지 않은 아이디 입니다. 중복확인을 수행해 주세요.");
			return;
		}//end if
		$("#frm").submit();
		
	});//click
	
	$("#id").keyup(function(){
		var id=$("#id").val();
		if( id.length > 3 ){
			
			$.ajax({
				url:"ajax_id_dup.jsp",
				type: "POST",
				data: "id="+id,
				dataType: "JSON",
				error : function( xhr ){
					alert("서버에서 문제가 발생하였습니다.");
					console.log( xhr.status );
				},
				success : function( jsonObj ){
					if( jsonObj.resultData ){
						$("#idDup").html("<font color='#FF0000'>아이디는 사용중입니다.</font>");
					}else{
						$("#idDup").html("<font color='#0000FF'>아이디는 사용가능합니다.</font>");
						$("#idDupFlag").val(0);
					}//end else
				}//success
					
			});//ajax
		}//end if
		
	});
});//ready
</script>

</head>
<body>
<%
String id=request.getParameter("id");
if( id ==null || "".equals(id) ){
	response.sendRedirect("member_list.jsp");
	return;
}//end if
ExamDAO5 eDAO=ExamDAO5.getInstance();
WebMemberDomain wmd=eDAO.selectOneMember(id);
if( wmd == null ){
%>
<script type="text/javascript">
alert("아이디가 존재하지 않습니다");
location.href="member_list.jsp";
</script>
<%
}//end if

//복호화
DataDecrypt dd=new DataDecrypt("a12345678901234567");
wmd.setName(dd.decryption(wmd.getName()));
wmd.setTel(dd.decryption(wmd.getTel()));
wmd.setEmail(dd.decryption(wmd.getEmail()));

pageContext.setAttribute("wmd", wmd);
%>
		<div class="writeForm">
		<form action="dynamic_set.jsp" name="frm" id="frm"  method="post">
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input data-value="아이디를 입력해주세요." value="${ param.id }"
						readonly="readonly" name="id" id="id" class="inputTxt inputIdtype" type="text" maxlength="20"  />
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
						<input data-value="이름을 입력해주세요." value="${ wmd.name }"
						readonly="readonly" id="name" name="name" class="inputTxt inputName" type="text"  />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">생일</label></th>
					<td >
						<input type="text" name="birthday" value="${ wmd.birth }"
						 id="birthday" data-value="생년월일을 입력해 주세요."/>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="text" name="cell" id="cell" value="${ wmd.tel }" />
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td class="mail_type">
					<%
					String tempEmail=wmd.getEmail();
					String email=tempEmail.split("@")[0];
					String domain=tempEmail.split("@")[1];
					%>
					<script type="text/javascript">
					$(function(){
						var domain="<%= domain %>";
						$("#email2 option").each(function(i,ele){
							if( $(ele).val() == domain ){
								$("#email2 option:eq("+i+")").prop("selected",true);
							}//end if
						});//each
						
					});//ready
					</script>
						<input data-value="이메일을 입력해주세요." value="<%= email %>" name="email1" id="email1" class="inputEmail" type="text" maxlength="100"  /><span class="email_txt">@</span>
						<select class="selecEmail" name="email2" id="email2" data-value="이메일을 선택해주세요.">
							<option value='naver.com'   >naver.com</option><option value='daum.net'   >daum.net</option><option value='gmail.com'   >gmail.com</option><option value='hotmail.com'   >hotmail.com</option><option value='nate.com'   >nate.com</option><option value='korea.com'   >korea.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="gender">성별</label></th>
 					<td> 
						<input data-value="성별을 선택하세요."${ wmd.gender eq '1'?" checked='checked'":"" } name="gender" type="radio" id="radio_check01" value="1" /><label for="radio_check01">남자</label>
 						<input name="gender" type="radio" id="radio_check02"  value="2" ${ wmd.gender eq '2'?" checked='checked'":"" }/><label for="radio_check02">여자</label>
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
						<input data-value="우편번호를 입력해주세요." value="${ wmd.zipcode }" type="text" class="zipcode" id="zipcode" name="zipcode" value=""/>
						<input type="button" value="우편번호 찾기" class="btn btn-info" id="btnZipcode"/>
					</td>
				</tr>
				<tr>
					<th><label for="addr0">주소</label></th>
					<td class="addr_td">
						<input data-value="주소를 입력해주세요." value="${ wmd.addr1 }" type="text" id="addr0" class="addr" name="addr0" /><br />
						<input data-value="상세주소를 입력해주세요." value="${ wmd.addr2 }" type="text" id="addr1" class="addr" name="addr1" value="" style="margin-top:7px;"  />
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
				<tr>
					<td>소개</td>
					<td>
					<textarea style="width: 600px;height: 100px" class="inputBox"
						id="info" name="info"><c:out value="${ wmd.info }"/></textarea>
					</td>
				</tr>
				<tr>
				<td>가입일 / ip : </td>
				<td>
				<c:out value="${ wmd.input_date } / ${ wmd.ip }"/>
				</td>
				</tr>
			</table>
			<input type="button" value="회원정보변경" class="btn btn-success" id="btn" />
			<input type="reset" value="초기화" class="btn btn-info" />
		</form>
		</div>
</body>
</html>