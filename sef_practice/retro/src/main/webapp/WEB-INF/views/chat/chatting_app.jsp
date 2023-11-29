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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 -->
<!--  jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
 <style type="text/css">
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
:root {
  --main-color: #eee;
  --chat-color: #339af0;
}
main {
  width: 100%;
  height: 750px;
  padding: 15px;
  position: relative;
  font-family: Arial, Helvetica, sans-serif;
}
section {
  width: 35%;
  display: inline-block;
  margin-left: 2%;
  position: relative;
  height: 100%;
}
.head {
  width: 100%;
  position: relative;
  margin-bottom: 20px;
  text-transform: capitalize;
}
.head .search {
  background-color: var(--main-color);
  width: 90%;
  padding: 13px;
  height: 40px;
  outline: none;
  border-radius: 20px;
  border: 1px solid var(--main-color);
  margin-right: 10px;
  margin-bottom: 10px;
}
.head .button {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: var(--chat-color);
  outline: auto;
  border: 1px solid var(--chat-color);
  position: absolute;
  top: 0;
}
.head .button i {
  color: white;
  font-size: 20px;
  padding: 0 0 10px 5px;
}
.chatting {
  width: 100%;
  height: 80px;
  text-transform: capitalize;
  padding: 0;
  display: flex;
  border-top: 2px solid var(--main-color);
}
section .image {
  width: 15%;
  padding: 8px 0;
}
section .image img {
  width: 60px;
  height: 60px;
  border-radius: 50%;
}
.chatting .des,
.active .des {
  width: 80%;
  height: 100%;
  line-height: 1px;
  display: inline-block;
  position: relative;
  padding-top: 5px;
}
.chatting .des .d {
  position: absolute;
  right: -3%;
  top: 25px;
  color: #b4b0b0;
  text-transform: uppercase;
}
.chatting p,
.active p {
  height: 20px;
  padding-top: 9px;
  color: #b4b0b0;
  font-size: 13px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  text-transform: none; 
}
.chatting .p .one,
.chatting .p .four {
  width: 40%;
}
.chatting .p .two,
.chatting .p .three,
.chatting .p .five {
  width: 58%;
}
section .active {
  background-color: var(--chat-color);
  color: white;
  border: none;
  position: absolute;
  width: 125%;
  left: -15%;
  padding-left: 15%;
  height: 80px;
  text-transform: capitalize;
  display: inline-block;
  overflow: hidden;
}
section .active .des .d {
  position: absolute;
  text-transform: uppercase;
  top: -63px;
  right: -10%;
}
section .active .des h4 {
  position: absolute; 
  top: -84px;
  left: 17%;
}
section .active .des p {
  position: absolute; 
  top: -55px;
  left: 17%;
  text-transform: lowercase;
  font-size: 13px;
  color: white;
}
section::after {
  content: "";
  width: 5px;
  height: 105%;
  background-color: var(--main-color);
  position: absolute;
  top: 0;
  margin-left: 110%;
  margin-top: -10%;
}
main .side {
  width: 60%;
  height: 100%;
  position: absolute;
  top: 0;
  right: -0.9%;
  margin-top: -1%;
  border-bottom: 1px solid var(--main-color);
}
.side .to {
  background-color: var(--main-color);
  width: 100%;
  height: 68px;
  padding: 20px 0 0 20px;
  text-transform: capitalize;
}
.side .to span {
  font-size: 25px;
  font-weight: 700;
}
.side .empty {
  width: 100%;
  height: 250px;
}
.side .time {
  text-align: center;  
  text-transform: capitalize;
  color: #c4c0c0;
  width: 100%;
  height: 20px;
}
.side .time::after,
.side .time::before {
  content: "";
  width: 27%;
  height: 2px;
  background-color: var(--main-color);
  position: absolute;
  top: 50%;
  right: 8%;
  margin-top: -6%;
}
.side .time::before {
  left: 8%;
}
.side .chat {
  width: 100%;
  padding: 15px 8%;
  position: relative;
  display: block;
}
.chat div {
  width: fit-content;
  padding: 15px;
  background-color: var(--chat-color);
  color: white;
  margin: 3px;
  border-radius: 5px;
  display: block;
}
.chat .recieved-1,
.chat .recieved-2 {
  position: absolute;
  right: 8%;
  background-color: var(--main-color);
  color: #000000d5;
}
.chat .recieved-2 {
  bottom: -71%;
}
.chat .send-3 {
  position: absolute;
  bottom: -108%;
  left: 8%;
}
.chat div::before {
  content: "";
  width: 20;
  height: 20;
  border-width: 10px;
  border-style: solid;
  border-color: transparent var(--chat-color) transparent transparent; 
  position: absolute;
  left: 6.5%;
}
.chat .send-3::before {
  left: -11%;
}
.chat .recieved-1::before,
.chat .recieved-2::before {
  border-color:  transparent  transparent transparent var(--main-color);
  left: 99%;
}
.side .input {
  position: absolute;
  width: 84%;
  display: block;
  position: absolute;
  bottom: 3%;
  left: 8%;
}
.side form {
  position: relative;
}    
form input {
  background-color: var(--main-color);
  width: 100%;
  height: 60px;
  border: none;
  border-radius: 10px;
}
form button {
  border: none;
  background-color: transparent;
  position: absolute;
  font-size: 25px;
  bottom: 25%;
  color: #cac6c6;
}
form .one {
  left: 3%;
}
form .two {
  right: 10%;
}
form .three {
  right: 3%;
}
</style>
<script type="text/javascript">
$(function(){
	
});//ready
</script>

</head>
<body>
<main>
  <section>
    <div class="head">
      <form action="">
        <input type="search" placeholder="search" class="search">
        <button class="button"><i class="fas fa-edit"></i></button>
      </form>
    </div>
    <div class="chatting">
      <div class="image">
        <img src="../3rd_project/images/whatsup.png" alt="">
      </div>
      <div class="des">
        <h4>이동원</h4>
        <div class="d">2:09 pm</div>
        <div class="p">
          <p class="one">안녕하세요 </p>
        </div>
      </div>
    </div>
    <div class="chatting">
      <div class="image">
        <img src="../3rd_project/images/whatsup.png" alt="">
      </div>
      <div class="des">
        <h4>양승연</h4>
        <div class="d">2:09 pm</div>
        <div class="p">
          <p class="two">실허요 </p>
        </div>
      </div>
    </div>
    <div class="chatting">
      <div class="image">
        <img src="../3rd_project/images/whatsup.png" alt="">
      </div>
      <div class="des">
        <h4>김인영</h4>
        <div class="d">2:09 pm</div>
        <div class="p">
          <p class="three">아직 판매하시나요? </p>
        </div>
      </div>
    </div>
    <div class="chatting">
      <div class="image">
        <img src="../3rd_project/images/whatsup.png" alt="">
      </div>
      <div class="des">
        <h4>임태균</h4>
        <div class="d">2:09 pm</div>
        <div class="p">
          <p class="four">잠시만요 </p>
        </div>
      </div>
    </div>
    <div class="chatting">
      <div class="image">
        <img src="../3rd_project/images/sw.jpg" alt="">
      </div>
      <div class="des">
        <h4>이승우</h4>
        <div class="d">2:09 pm</div>
        <div class="p">
          <p class="five">ㅋㅋㅋㅋㅋㅋㅋ</p>
        </div>
      </div>
    </div>
    <div class="active">
      <div class="">
        <div class="image">
          <img src="../3rd_project/images/drake.jpg" alt="">
        </div>
        <div class="des">
          <h4>drake</h4>
          <div class="d">2:09 pm</div>
          <div class="p">
            <p class="six">how do you do a space</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <div class="side">
    <div class="to"><span>drake</span></div>
    <div class="empty"></div>
    <div class="time">월요일, 1:27pm</div>
    <div class="chat">
      <div class="send-1">So, how’s your new phone?</div>
      <div class="send-2">You finally have a 	phone :D</div>
      <div class="recieved-1">Drake</div>
      <div class="recieved-2">Why aren’t you answering?</div>
      <div class="send-3">???</div>
    </div>
    <div class="input">
      <form action="">
        <button class="one"><i class="fal fa-paperclip"></i></button>
        <input type="text" placeholder="" class="writting"/>
        <button class="two"><i class="far fa-meh"></i></button>
        <button class="three"><i class="fab fa-telegram-plane"></i></button>
      </form>
    </div>
  </div>
</main>
</body>
</html>