<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="usebean을 사용하여 web parameter받기" %>
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
	
});//ready
</script>

</head>
<body>

<% //post방식의 한글 처리
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pVO" class="day1013.ParameterVO" scope="page"/>
<!-- web parameter 받기 -->
<jsp:setProperty property="*" name="pVO"/>
입력받은 값 출력<br/>
id,password,name,birthday,tel,cell,email1,email2,gender,area,zipcode,addr0,addr1;
	
private String[] lang;

<ul>
<li>아이디 : <jsp:getProperty name="pVO" property="id">( ${ param.id } )</li>
<li>비밀번호 : <jsp:getProperty name="pVO" property="password">(${ param.password })</li>
<li>이름 : <jsp:getProperty name="pVO" property="name">(${param.name })</li>
<li>연락처 : <jsp:getProperty name="pVO" property="tel">(${ param.name })</li>
<li>휴대폰 : <jsp:getProperty name="pVO" property="cell">(${ param.cell })</li>
<li>이메일 : <jsp:getProperty name="pVO" property="email1">(${ param.email1 })@(${ param.email2 })</li>
<li>성별 : <jsp:getProperty name="pVO" property="gender">(${ param.gender })</li>
<li>소재지 : <jsp:getProperty name="pVO" property="area">(${ empty param.area?"선택한 도시 없음" : param.name })</li>
<li>우편번호 : <jsp:getProperty name="pVO" property="zipcode">(${ param.zipcode })</li>
<li>주소 : <jsp:getProperty name="pVO" property="addr0">(${ param.addr0 }) (${ param.addr1 })</li>
<li>관심언어 : <jsp:getProperty name="pVO" property="lang">(${ paramValues.lang })</li>
<!-- 배열을 주소가 출력되므로 이전의 코드를 사용하여 사용자에게 보여준다 -->

<li>관심언어 : <%
if(pVO.getLang() != null){
	
//try{
	int i=0;
for(String lang: pVO.getLang()){ 
//checkbox를 check하지 않으면 web parameter가 생성되지 않아 받을 수 있는 값이 없으므로
//NullPointerException이 발생한다
%>
					<%=lang %> (${ paramValues.lang[i] }) <!-- EL에서는 선언된 변수를 사용할 수 없다. -->
					<%
			i++;				
	} 

// }catch(NullPointerException npe){
//	out.print("관심언어 없음");
//} 

}else {
	out.print("관심언어 없음");
}//end else
%>
</li>
</ul>

</body>
</html>








