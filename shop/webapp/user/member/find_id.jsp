<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="아이디 찾기" %>
<jsp:include page="../../cdn/cdn.jsp" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="http://192.168.0.70/jsp_prj/common/main/favicon-32x32.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    <style type="text/css">
        #wrap {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 100px;
            margin-bottom: 100px;
        }

        .form-search input[type="text"] {
            width: 100%;
            box-sizing: border-box;
            padding: 5px;
            margin-bottom: 10px;
        }

        .btnSearch input[type="button"] {
            padding: 10px 40px;
            font-size: 12px;
            margin-left: 120px;
            margin-bottom: 20px;
        }

        .search-title h3 {
            font-size: 15px;
            margin-left: 120px;
            margin-bottom: 20px;
        }

        .form-search {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-search label {
            margin-bottom: 5px;
            display: block;
        }
        
        .form-search .input-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .form-search .input-group label {
            width: 100px; /* 라벨의 너비 조절 */
            text-align: right;
            margin-right: 10px;
        }

        .form-search .input-group input[type="text"] {
            flex: 1;
            padding: 5px;
        }
        #footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    margin-left: 330px;
}
    </style>
</head>
<body>
    <!-- header -->
    <%@ include file="../layout/header.jsp"%>
    <div id="wrap">
        <form name="idfindscreen" method="POST">
            <div class="search-title">
                <h3>아이디 찾기</h3>
            </div>
            <section class="form-search">
                <div class="input-group">
                    <label for="member_name">이름</label>
                    <input type="text" id="member_name" name="member_name" class="btn-name" placeholder="이름을 입력하세요">
                </div>

                <div class="input-group">
                    <label for="member_phone">휴대폰번호</label>
                    <input type="text" id="member_phone" onKeyup="addHypen(this);" name="member_phone" class="btn-phone" placeholder="휴대폰번호를 '-'없이 입력">
                </div>
            </section>

            <div class="btnSearch">
                <input type="button" name="enter" value="확인" onClick="location.href='find_id_result.jsp' ">
            </div>
        </form>
    </div>

<%@ include file="../layout/footer.jsp" %>
</body>
</html>    
