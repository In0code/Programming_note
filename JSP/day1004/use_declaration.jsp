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

</style>
<script type="text/javascript">
$(function(){
   
});//ready
</script>

</head>
<body>
<%!
   //! class field�� �ڵ尡 �����ȴ�.
   int i; //instance���� // �����ڰ� ��û�� �ϸ� ��ü�� �����ǹǷ�, �����ڴ� ��üȭ�� ���� �ʰ�
   //����ϸ� �ȴ�.
   public void test(){
   System.out.println("�ȳ�?");
}
   
   public String getMsg() {
      String msg="���� ���ϽĴ� ������ ���� �������ϴ�.";
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

int j=0;//�������� , ���������� �ʱ�ȭ �����ʰ� ����ϸ� error�߻�
%>
�ν��Ͻ����� : <%=i %>
�������� : <%=j %><br>
<%=getMsg() %><br>
<%String[] names={"���ֹ�","�輱��","�ڻ���","ȫ����","ȫ����"}; 
%>
<table class="table table-hover">
<tr>
<th>�̸�</th>
<th>����</th>
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