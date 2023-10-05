<%@page import="day1004.testDAO"%>
<%@page import="day1004.testVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<style type="text/css">
td{text-align: center; font-weight: bord}
td:hover{background-color:#E6E6E6; cursor: pointer; }
</style>
<script type="text/javascript">
$(function(){
   
});//ready
function result(i,j) {
	alert(i*j);
	let output="<strong>"+j+"x"+i+"="+i*j+"</strong>";
	  $("#div").html(output);
	
}
</script>

</head>
<body>
 <%
      //scriptlet : method ���� java code ������ �� ����Ѵ�.
      String msg="������ �����ϵ� ����^o^";
 %>
   <mark><%= msg %></mark>
  <%
  msg="�̹��ִ� ��Ʋ�� ��...";
  %>
  <div>
  <marquee scrollamount="25"><%= msg %></marquee>
  </div>
<%
for(int i=1; i<7; i++){
%>
<h<%= i %>>�ȳ��ϼ���</h<%= i %>>
<%	
}//end for
%>

<!-- 1~100���� �ɼ��� ������ �ִ� select ��� -->
<select>
<% for(int j=1; j<101; j++){ %>
	<option><%= j %></option>
<%}//end for %>
</select><br/>

<%
//java���� �����ϴ� ��ü�� ��� ����� �� �ִ�
Calendar cal=Calendar.getInstance();
int nowYear=cal.get(Calendar.YEAR);		
%>
<select>
<option>---��---</option>
<%for(int i=-2; i<3; i++){ %>
<option <%= nowYear+i==nowYear?"selected='selected'":"" %>><%= nowYear+i %></option>
<%} //end for %>
</select>
<%
int nowMonth=cal.get(Calendar.MONTH)+1;
%>
<select>
<option>---��---</option>
<% for(int i=1; i<13; i++){ %>
	<option<%= i==nowMonth?" selected='selected'":"" %>><%= i %></option>
<%} //end for %>
</select>
<%
int nowDay=cal.get(Calendar.DAY_OF_MONTH);
int lastDay=cal.getActualMaximum(Calendar.DATE);
		
%>
<select>
<option>---��---</option>
<% for(int i=1; i<lastDay+1; i++){ %>
	<option<%= i==nowDay?" selected='selected'":"" %>><%= i %></option>
<%} //end for %>
</select><br/>

<div  style="width: 800px">
<div id="div" style="height:30px"></div>
<table class="table table-bordered border-primary">
<% for(int i=1; i<10; i++){ %>
<tr >
	<% for(int j=1; j<10; j++){ %>
	<td onclick="result('<%= i%>','<%= j%>')"><%= i %> X <%= j %></td>	
	<%} %>
</tr>
<%} %>
</table>
</div>

<div style="width:600px">
	<table class="table table-hover">
		<thead>
			<tr>
				<th id="numTitle">��ȣ</th>
				<th id="imgTitle">�̹���</th>
				<th id="infoTitle">����</th>
			</tr>
		</thead>
		<tbody>
		<!-- selectURL method�� ȣ���Ͽ� ��ȣ, �̹���, ����
		�̹����� Ŭ���ϸ� �ش� site�� �̵��ϵ��� link ���� -->
		<%
		testDAO tDAO=new testDAO();
		List<testVO> list=tDAO.selectURL();
		
		testVO tVO=null;
		for(int i=0; i<list.size(); i++){
			tVO=list.get(i);
			%>
			<tr>
			<td><%= i+1 %></td>
			<td><a href="http://<%= tVO.getUrl() %>">
			<img src="http://localhost/jsp_prj/common/images/<%=tVO.getImg()%>" 
			style="width:80px; height:50px"></a></td>
			<td><%= tVO.getInfo() %></td>
			</tr>
			<%
		}//end for
		%>
		</tbody>
	</table>
</div>
</body>
</html>