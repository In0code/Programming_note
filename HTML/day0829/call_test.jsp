<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나는 JSP야. 요청하면 HTML로 변경되어 응답되지!
	<br /> 요청을 받고, JSP를 찾아서, Java Source Code로 변경한 후 컴파일을 해서, HTML로 변화한 후,
	클라이언트에게 응답해주는 프로그램을 WAS라고 해.
	<br>
	<marquee>${ param.name }님 안녕하세요?</marquee>
	readonly 주소1 : ${ param.addr1 }
	<br /> disabled 주소2 : ${ param.addr2 }
</body>
</html>