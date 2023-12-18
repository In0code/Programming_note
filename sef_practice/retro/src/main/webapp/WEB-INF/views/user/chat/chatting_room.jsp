<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
body,
html {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	border: 0;
	scroll-behavior: smooth;
	background: linear-gradient(
		90deg,
		rgba(131, 58, 180, 1) 0%,
		rgba(253, 29, 29, 1) 50%,
		rgba(252, 176, 69, 1) 100%
	);
	max-width: 100%;
	overflow-x: hidden;
}
img {
	max-width: 100%;
}

.chatGroup {
	height: 100vh;
	width: 100%;
	display: grid;
	grid-template-columns: auto;
	align-items: center;
}

.chatParent {
	background-color: #fff;
}
.chatParent .chatperson img {
	border-radius: 50%;
	-webkit-border-radius: 50%;
	width: 100px;
}
.chatParent .chatperson {
	text-align: center;
}
.chatParent .chatperson h5 {
	margin: 10px 0 0 0;
}
.chat-bg::before {
	z-index: -1;
	position: absolute;
	width: 100%;
	height: 100%;
	background: #fff;
	content: "";
	left: 0;
	top: 0;
	opacity: 0.3;
	background: url(https://preview.redd.it/qwd83nc4xxf41.jpg?width=640&crop=smart&auto=webp&s=e82767fdf47158e80604f407ce4938e44afc6c25)
		no-repeat center center #ffffff;
	background-size: cover;
}
.chat-bg {
	z-index: 0;
	position: relative;
	max-height: 500px;
	overflow: auto;
}
.chatParent .chatInput {
	line-height: 40px;
	height: 40px;
	color: #222;
}

.chatParent .chatInput:focus {
	box-shadow: 0 0 0 0.2rem rgb(0 0 0 / 5%);
	-webkit-box-shadow: 0 0 0 0.2rem rgb(0 0 0 / 5%);
}
.chatParent .chatInput::placeholder {
	font-size: 14px;
	line-height: 40px;
}
.chatParent .chatmain .leftMessage span {
	background-color: #f1136c;
}
.chatParent .chatmain .leftMessage span,
.chatParent .chatmain .rightMessage span {
	word-break: break-all;
}
.leftMessage span,
.rightMessage span {
	border-radius: 20px;
	-webkit-border-radius: 20px;
}

</style>
<script type="text/javascript">
$(document).ready(function () {
	$("#updateLeft").focus();
});

$(document).keypress(function (e) {
	if (e.which == 13) {
		sendMsgFormLeft();
		sendMsgFromRight();
	}
});

function sendMsgFormLeft() {
	var leftmsg = document.getElementById("updateLeft");
	if (leftmsg.value != "") {
		document.getElementById("chatCanvas").innerHTML +=
			'<div class="leftMessage"><span class="text-left d-inline-block px-3 py-1 text-white my-1">' +
			leftmsg.value +
			'</span> <br> <small class="text-muted">' +
			new Date().toLocaleDateString() +
			" " +
			new Date().toLocaleTimeString() +
			"</div>";
		leftmsg.value = "";
	}
}

function sendMsgFromRight() {
	var righttmsg = document.getElementById("updateRight");
	if (righttmsg.value != "") {
		document.getElementById("chatCanvas").innerHTML +=
			'<div class="rightMessage text-right"><span class="text-left d-inline-block bg-secondary text-white px-3 py-1 my-1">' +
			righttmsg.value +
			'</span> <br> <small class="text-muted">' +
			new Date().toLocaleDateString() +
			" " +
			new Date().toLocaleTimeString() +
			"</samll></div>";
		righttmsg.value = "";
	}
}

</script>

</head>
<body>
<div class="chatGroup">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-12">
				<div class="chatParent p-3 rounded">
					<h4 class="text-center">RE:TRO</h4>
					<hr>
					<div class="row justify-content-between">
						<div class="col-md-3">
							<div class="chatLeft p-2 border rounded chatperson">
								<img src="https://blog.gentrop.com/hubfs/perfil-gaspar.png" alt="avatar">
								<h5>닉네임</h5>
								<small class="text-muted">판매자</small>
								<div class="chatinput">
									<input class="my-2 border rounded-pill w-100 form-control chatInput" placeholder="Type here..." id="updateLeft">
									<button class="btn btn-primary rounded-pill w-100" type="submit" id="sendLeftmsg" onclick="sendMsgFormLeft()">Send</button>
								</div>
							</div>
						</div>
						<div class="col-md-6 border rounded chat-bg">
							<div class="chatmain py-3" id="chatCanvas">

							</div>
						</div>
						<div class="col-md-3">
							<div class="chatRight border p-2 rounded chatperson">
								<img src="https://imgur.com/7Lht9zY.png" alt="avatar">
								<h5>닉네임2</h5>
								<small class="text-muted">구매자</small>
								<div class="chatinput">
									<input class="my-2 border rounded-pill w-100 form-control chatInput" placeholder="Type here..." id="updateRight">
									<button class="btn btn-primary rounded-pill w-100" type="submit" id="sendRightmsg" onclick="sendMsgFromRight()">Send</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>