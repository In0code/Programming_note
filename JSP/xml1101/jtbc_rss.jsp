<%@page import="java.util.List"%>
<%@page import="org.w3c.dom.html.HTMLLabelElement"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
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
<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		if($("#newsType").selectedIndex != 0){
			
		$("#link").val($("#newsType").val());
		$("#frm").submit();
		}//end if
	});//click
});//ready
</script>

</head>
<body>
<form id="frm" name="frm">
<input type="hidden" name="link" id="link"/>
</form>
<%
String[] title={"속보","정치","경제","사회","국제","문화","연예","스포츠","풀영상","뉴스랭킹","뉴스룸","상암동 클라스","뉴스5후"};
String[] link={"newsflash","politics","economy","society","international","culture",
		"entertainment","sports","fullvideo","newsrank","newsroom","morningand","news5pm"};

String paramLink=request.getParameter("link");

%>
<select id="newsType" class="inputBox">
<option value="">-----뉴스선택-----</option>
<%
for(int i=0; i < title.length ; i++){
	%>
<option value="<%= link[i] %>"<%= link[i].equals(paramLink)?" selected='selected'":"" %>><%= title[i] %></option>
	<%
}

	
%>
</select>
<input type="button" value="뉴스보기" class="btn btn-success" id="btn"/>
<div id="news">
<%
if( paramLink != null && !"".equals(paramLink)){
//1. builder 생성
SAXBuilder builder=new SAXBuilder();
//2. 문서 객체 얻기
Document doc=builder.build(new URL("https://fs.jtbc.co.kr/RSS/"+paramLink+".xml"));
//3. 최상위 부모노드 얻기
Element rssNode=doc.getRootElement();

//4. 자식 노드 얻기
Element channelNode=rssNode.getChild("channel");
Element categoryNode=channelNode.getChild("category");
Element pubNode=channelNode.getChild("pubDate");
%>
<div>
카테고리 : <strong><%= categoryNode.getValue() %></strong><br/>
기사 작성일 : <strong><%= pubNode.getValue()%></strong>
<%
//item 노드들 얻기
List<Element> itemNodes=channelNode.getChildren("item");

Element titleNode=null;
Element linkNode=null;
Element descriptionNode=null;
Element pubDateNode=null;

for(Element itemNode : itemNodes ){
	titleNode=itemNode.getChild("title");
	linkNode=itemNode.getChild("link");
	descriptionNode=itemNode.getChild("description");
	pubDateNode=itemNode.getChild("pubDate");
	%>
	<table class="table">
	<tr>
		<td>제목</td>
		<td><a href="<%= linkNode.getValue() %>"><%= titleNode.getValue() %></a></td>
		<td>작성일</td>
		<td><%= pubDateNode.getValue() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3"><%= descriptionNode.getValue() %></td>
	</tr>
	</table>
<%
}//end for
%>
</div>
<%
}//end if
%>
</div>
</body>
</html>










