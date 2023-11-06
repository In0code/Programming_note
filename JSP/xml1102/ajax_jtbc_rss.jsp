<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.160/jsp_prj/common/main/favicon.png">
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
		var link = $("#newsType").val();
		$.ajax({
			url : "https://fs.jtbc.co.kr/RSS/"+link+".xml",
			type : "get",
			dataType : "XML",
			error : function(xhr){
				alert("JTBC RSS 로딩에 문제가 발생하였습니다.");
				console.log(xhr.status);
			},
			success : function(xml){
			var output="<div>";
			//parsing
			output+= "<strong>작성일</strong> : "+$(xml).find("pubDate").first().text();
			output+= "<br/><strong>설명</strong> : "+$(xml).find("description").first().text();
			
			var title;
			var link;
			var description;
			var pubDate;
			$(xml).find("item").each( function ( i, itemNode){
					title=$(itemNode).find("title").text();
					link=$(itemNode).find("link").text();
					description=$(itemNode).find("description").text();
					pubDate=$(itemNode).find("pubDate").text();
					
					output+="<div style='margin-top:10px'>";
					output+="<table class='table'>";
					output+="<tr>";
					output+="<td>제목</td><td>"+(i+1)+"</td>";
					output+="<td>번호</td><td><a href='"+link+"'>"+title+"</a></td>";
					output+="<td>작성일</td><td>"+pubDate+"</td>";
					output+="</tr>";
					output+="<tr>";
					output+="<td>기사</td><td colspan='5'>"+description+"</td>";
					output+="</tr>"
					output+="</table>"
					output+="</div>"
			});//each
			
			
			output+"</div>";
			$("#newsOutput").html(output);
				
		
				
			}//success
		});//ajax
	
		}//end if
	});//click
});//ready
</script>

</head>
<body>
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
}//end for
%>
</select>
<input type="button" value="뉴스보기" class="btn btn-success" id="btn"/>
<div id="newsOutput">
</div>

</body>
</html>










