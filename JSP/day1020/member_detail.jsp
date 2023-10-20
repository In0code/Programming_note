<%@page import="kr.co.sist.util.cipher.DataDecrypt"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.WebMemberVO"%>
<%@page import="kr.co.sist.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="회원 상세 정보" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <c:if test="${ empty sesId }">
  <c:redirect url="login_frm.jsp"/>
  </c:if>
     
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
	
	$("#id").keydown(function(){
		$("#idDupFlag").val(0);
	});
});//ready
</script>

</head>
<body>
<%
String id=request.getParameter("id");
if( id==null || "".equals(id)){
	response.sendRedirect("https://www.police.go.kr/index.do");
	return;
}//end if

MemberDAO mDAO=MemberDAO.getInstane();
try{
WebMemberVO wmVO=mDAO.selectMember(id);

String email="";
DataDecrypt dd=new DataDecrypt("a12345678901234567");
email=dd.decryption(wmVO.getEmail());

wmVO.setEmail1(email.split("@")[0]);
wmVO.setEmail2(email.split("@")[1]);
wmVO.setName(dd.decryption(wmVO.getName()));
wmVO.setCell(dd.decryption(wmVO.getCell()));

pageContext.setAttribute("member", wmVO);
}catch(SQLException se){
	se.printStackTrace();
	response.sendRedirect("../day1019/main.jsp");
	return;
}//end catch
%>
		<div class="writeForm">
		<form action="member_update_process.jsp" name="frm" id="frm"  method="post">
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input data-value="아이디를 입력해주세요." readonly="readonly"
						 value="${ member.id }" name="id" id="id" class="inputTxt inputIdtype" type="text" maxlength="20"  />
					</td>
				</tr>
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input value="${ member.name }" id="name" name="name" class="inputTxt inputName" type="text"  />
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">생일</label></th>
					<td >
						<input type="text" name="birthday" id="birthday"value="${ member.birthday }"/>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="text" name="cell" id="cell" value="${ member.cell }" />
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td class="mail_type">
						<input value="${ member.email }" name="email1"
						value="${ member.email1 }"
						 id="email1" class="inputEmail" type="text" maxlength="100"  /><span class="email_txt">@</span>
						 <%
						 String[] email={"naver.com","daum.net","gmail.com","hotmail.com","nate.com","korea"};
						 pageContext.setAttribute("email", email);
						 
						 %>
						<select class="selecEmail" name="email2" id="email2" data-value="이메일을 선택해주세요.">
							<c:forEach var="email" items="${ email }">
							<option value="${ email }"${ email eq member.email2?" selected='selected'":"" }><c:out value="${ email }"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="gender">성별</label></th>
 					<td> 
						<input name="gender" type="radio" id="radio_check01" value="1" ${ member.gender eq '1'?"checked='checked'":"" }/><label for="radio_check01">남자</label>
 						<input name="gender" type="radio" id="radio_check02"  value="2" ${ member.gender eq '2'?"checked='checked'":"" }/><label for="radio_check02">여자</label>
 					</td> 
				</tr> 
				<tr>
					<th><label for="area">소재지</label></th>
					<td>
					<%
					String[] area={"강원","경기","경남","경북","광주","대구","대전","부산","서울","울산","인천","전남","전북","제주","충남","충북","해외"};
					pageContext.setAttribute("area", area);
					%>
						<select id="area" name="area">
							<option value="">선택해주세요.</option>
							<c:forEach var="area" items="${ area }" varStatus="i">
							<option value="${ i.count }"${ i.count eq mamber.area?" selected='selected'":"" }><c:out value="${ area }"/></option>
							</c:forEach>
						</select>
<!-- 						<input  id="area" name="area" class="inputTxt inputName" type="text" /> -->
					</td>
				</tr>
				<tr>
					<th><label for="zipcode">우편번호</label></th>
					<td>
						<input value="${ member.zipcode }" readonly="readonly" type="text" class="zipcode" id="zipcode" name="zipcode"/>
						<input type="button" value="우편번호 찾기" class="btn btn-info" id="btnZipcode"/>
					</td>
				</tr>
				<tr>
					<th><label for="addr0">주소</label></th>
					<td class="addr_td">
						<input value="${ member.addr1 }" type="text" id="addr0" class="addr" name="addr0" /><br />
						<input value="${ member.addr2 }" type="text" id="addr1" class="addr" name="addr1" value="" style="margin-top:7px;"  />
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
						id="info" name="info"><c:out value="${ member.info }"/></textarea>
					</td>
				</tr>
				<tr>
					<td>가입일 / 가입 ip</td>
					<td><c:out value="${ member.inputDate } / ${ member.ip }"/></td>
				</tr>
				
			</table>
			<input type="button" value="변경" class="btn btn-success" id="btn" />
			<input type="reset" value="초기화" class="btn btn-info" />
		</form>
		</div>
</body>
</html>