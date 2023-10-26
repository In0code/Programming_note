<%@page import="member.dao.MemberDAO"%>
<%@page import="java.sql.SQLException"%>
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
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
#wrap{ width:502px; height:303px; margin:0px auto;}
#idDup{width: 502px; height: 303px; background: #FFFFFF url( ../images/id_background.png) no-repeat;}
#idDiv{ position: absolute; top:100px; left:80px; width:300px; }
#idResult{ position: absolute; top:200px; left:80px}
</style>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
	      chkNull();
	   });//click
	   
	   $("#id").keydown(function( evt ){
	      if(evt.which == 13){ //엔터가 눌렸니?
	      chkNull();
	         
	      }//end if
	   });//keydown
	   
	});//ready

	function chkNull(){
	    var id =$("#id").val();
	     
	     if(id.trim() == ""){
	        alert("중복확인할 아이디를 입력해 주세요.");
	        return;
	     }//end if
	     $("#frm").submit();   
	}//chkNull
	
</script>
<script type="text/javascript">

function useId(id){
	//부모창에 전달한 후 (opener)
   opener.window.document.frm.id.value = id;
	//중복확인 flag를 설정
	opener.window.document.frm.idDupFlag.value = 1;
	//자식창을 닫기
   self.close();
}
</script>
</head>
<body>
<div id="wrap">
      <div id="idDup">
      <div id="idDiv">
         <form name="subFrm" id="frm" action="id_check.jsp">
         <div>
            <label>아이디</label>
            <input type="text" id="id" name="id" class="inputBox" style="width:150px;"
            maxlength="16" autofocus="autofocus" value="${ param.id }"/>
            <input type="button" value="중복확인" class="btn" id="btn"/>
            <input type="text" style="display: none"/>
         </div>
      </form>
      </div>
      <div id="idResult">
<c:catch var="se">
            <%
            String id = request.getParameter("id");
            if(id != null && !"".equals(id)){		//id가 null이 아니면서 id랑 맞지않으면 db작업
               // DB에서 입력된 아이디를 검색
               MemberDAO mDAO = MemberDAO.getInstance();
               try{
               boolean flag = mDAO.selectId(id);
               pageContext.setAttribute("flag", flag);
               %>
            <strong><c:out value="${ param.id }"/></strong>는
            <c:set var="msg" value="사용중 입니다."/>
            <c:choose>
               <c:when test="${ flag }">
               <span style="color:#DC5460"> 이미 사용 중 입니다.</span>
               </c:when>
               <c:otherwise>
               <span style="color:#233942"> 사용 가능합니다.</span>
               <a href="javascript:useId('${ param.id }')">사용</a>
               </c:otherwise>
            </c:choose>
               <%
               }catch(SQLException se){
                  se.printStackTrace();
               }                
            }//end if
            %>
      </c:catch>
      <c:if test="${ not empty se }">
         문제가 발생하였습니다. 잠시 후 시도해 주세요.
      </c:if>
      </div>
      </div>
   </div>
</body>
</html>










