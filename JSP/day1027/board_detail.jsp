<%@page import="oracle.net.aso.b"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.BoardListVO"%>
<%@page import="kr.co.sist.member.dao.BoardDAO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
   $("#replyTitle").click(function(){
      var replyText="열기";
      if($("#replyTitle").text()=="열기"){
         openReply(${param.num})
         replyText="닫기";
      }else{
         $("#output").html("");
      }//end else
      $("#replyTitle").html(replyText);
   });//click
});//ready

function openReply(num){
   var paramJson = {num:num};
   $.ajax({
      url:"reply_list.jsp",
      type:"get",
      data: paramJson,
      dataType:"JSON",
      error: function(xhr){
         alert(xhr.status);
      },
      success: function(jsonObj){
         var output="<strong>댓글</strong>";
         
         if(jsonObj.dataEmpty){
            output+="<div>해당글에는 댓글이 없습니다.<br/>"+
            "<img src='../common/images/error.jpg' width='100'/></div>"
         }//end if
         
         if(!jsonObj.dataEmpty){
            $.each(jsonObj.data,function(i,json){
               output+="<div id='reply_'"+json.reply_num+"' class='reply'>"+json.content+" / "+json.input_date+"<br>"+" / "+json.writer+
               "<a href='#void' onclick='removeReply("+json.reply_num+")' class='btn btn-warning'>삭제</a></div>"
            });//each
            
         }//end for
         
         $("#output").html(output);
      }
      
   });//ajax
}//openReply

function removeReply(num){
   $.ajax({
      url:"remove_reply.jsp",
      type:"get",
      data:"num="+num,
      dataType:"json",
      error:function(xhr){
         console.log(xhr.status)
      },
      success:function(jsonObj){
         if(jsonObj.deleteFlag){
            alert("리플이 삭제되었습니다.");
            $("#reply_"+num).remove();
            if( $(".reply").length == 0){
            	var output="<div>해당글에는 댓글이 없습니다.<br/>"+
                 "<img src='../common/images/error.jpg' width='100'/></div>";
                 
                 $("#output").html( output );
            }//end if
         }else{
            alert("리플 삭제 실패")         
         }//end else
      }
   });//ajax
}//removeReply

<%
String paramNum=request.getParameter("num");
int num=0;
if(paramNum == null){
   %>
   alert("글을 선택해주세요.");
   location.href="board_list.jsp";
   <%
}//end if

if(paramNum != null){
   num=Integer.parseInt(paramNum);
}
BoardDAO2 bDAO=BoardDAO2.getInstance();
try{
BoardListVO blVO=bDAO.selectBoardDetail(num);
pageContext.setAttribute("blVO", blVO);
}catch(SQLException se){
   se.printStackTrace();;
}

%>
</script>

</head>
<body>

<div id="wrap">
<table class="table">
<tr>
<td>번호</td>
<td><input type="text" name="num" value="${ param.num }" readonly="readonly"
      class="inputBox"/></td>
<td>제목</td>
<td><c:out value="${ blVO.subject }"/></td>
</tr>
<tr>
<td>내용</td>
<td colspan="3">
<textarea class="inputBox" style="width: 300px; height: 100px"><c:out value="${ blVO.content}"/></textarea>
</td>
</tr>
<tr>
<td>작성자</td>
<td colspan="3">
<input type="text" value="${ blVO.writer }" class="inputBox" readonly="readonly"/>
</td>
</tr>
<tr>
<td>작성일</td>
<td colspan="3">
<fmt:formatDate value="${ blVO.input_date }" pattern="yyyy-MM-dd HH:mm"/>
</td>
</tr>
</table>
<div>
<span id="replyTitle">열기</span>
</div>
<div id="output"></div>
</div>
</body>
</html>


