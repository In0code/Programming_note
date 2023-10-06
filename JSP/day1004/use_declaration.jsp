<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
});//ready
</script>

</head>
<body>
<%!
   //! class field에 코드가 생성된다.
   int i; //instance변수 // 접속자가 요청을 하면 객체가 생성되므로, 개발자는 객체화를 하지 않고
   //사용하면 된다.
   public void test(){
   System.out.println("안녕?");
}
   
   public String getMsg() {
      String msg="오늘 지하식당 점심은 맛이 없었습니다.";
      return msg;   
   }//getmsg
   
   public String createRadio(int cnt, int nameInd ,int selectedInd ) {
      StringBuilder sb= new StringBuilder();
      for(int i=1; i<cnt+1; i++){
      sb.append("<input type='radio' name='r").append(nameInd).append("'")
      .append("value='").append(i).append("'").append(i==selectedInd?"checked='checked'":"")
      .append("/>").append(i).append("\n");
      }//end for
      return sb.toString();
   }
%>
<%test();

int j=0;//지역변수 , 지역변수는 초기화 하지않고 사용하면 error발생
%>
인스턴스변수 : <%=i %>
지역변수 : <%=j %><br>
<%=getMsg() %><br>
<%String[] names={"김주민","김선경","박상준","홍지성","홍찬영"}; 
%>
<table class="table table-hover">
<tr>
<th>이름</th>
<th>점수</th>
</tr>
<%for(int i=0;i<names.length;i++){ %>
<tr><td><%=names[i] %></td>
<td><%=createRadio(10,i,5) %></td>
<td>
<!-- <%for (int k=1 ; k<11 ;k++){
    %>
   <input type="radio" name="r<%=i %>" value="<%=k %>"><%=k %>
 <%} %>  -->


</td>
</tr>
<%} %>

</table>
</body>
</html>