<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.137/html_prj/common/css/main_v20230906.css">
<style type="text/css">
#wrap { width: 502px; height: 303px; margin: 0px auto; }
#idDup { width: 502px; height: 303px; background: #FFFFFF url(images/id_background.png) no-repeat; position: relative; }
#idDiv{ position: absolute;top:100px ; left :80px ; width: 300px;}
</style>
<script type="text/javascript">
window.onload=function(){
    document.getElementById("btn").addEventListener("click",sendId);
}//onload

function sendId(){
    //아이디를 가져와서
    var id=document.subFrm.id.value;
    //부모창에 전달한 후 (opener)  
    opener.window.document.frm.id.value=id;
    //자식창을 닫기
    self.close();
}
</script>
</head>
<body>
	<div id="wrap">
		<div id="idDup">
			<div id="idDiv">
				<form name="subFrm">
					<label>아이디</label>
					 <input type="text" name="id" class="inputBox"
						style="width: 160px;" maxlength="16" autofocus="autofocus" value="${param.id}"/>
						<%
						String id=request.getParameter("id");
						%>
						<input type="text" name="id" class="inputBox"
						style="width: 160px;" maxlength="16" autofocus="autofocus" value="<%= id %>"/> 
						<input type="button" value="중복확인" class="btn" id="btn" />
				</form>
			</div>

		</div>
	</div>

</body>
</html>