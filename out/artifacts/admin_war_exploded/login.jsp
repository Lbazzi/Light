<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理登录</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <style>
        body {
            background-image: linear-gradient(125deg,#2c3e50,#abc7ff,#F0EFF0,#41c7af);
            background-size: 400%;
            animation: bganimation 15s infinite;
        }

        @keyframes bganimation {
            0%{
                background-position: 0% 50%;
            }
            50%{
                background-position: 100% 50%;
            }
            100%{
                background-position: 0% 50%;
            }
        }
        body {
            margin: 0;
            padding: 0;
        }
        .box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 400px;
            padding: 40px;
            background: rgba(0, 0, 0, .8);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0, 0, 0, .5);
            border-radius: 10px;
        }
        .box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
        }
        .box .inputBox {
            position: relative;
        }
        .box .inputBox input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            letter-spacing: 1px;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }
        .box .inputBox label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }
        .box .inputBox input:focus ~ label,
        .box .inputBox input:valid ~ label {
            top: -18px;
            left: 0;
            color: #03a9f4;
            font-size: 12px;
        }
        button {
            margin: 6px 0;
            height: 36px;
            border: none;
            background-color: rgba(54, 147, 190, 0.4);
            border-radius: 4px;
            padding: 0 140px;
            color: white;
            overflow: hidden;
            cursor: pointer;
            position: relative;
            transition: 0.4s;
            margin-top: 5px;
        }
        button :hover {
            background-color: #03a9f4;
        }
        button::before,
        button::after {
            content: "";
            display: block;
            width: 80px;
            height: 100%;
            background: rgba(25, 150, 155, 0.5);
            opacity: 0.5;
            position: absolute;
            left: 0;
            top: 0;
            transform: skewX(-15deg);
            filter: blur(30px);
            overflow: hidden;
            transform: translateX(-100px);
        }
        button::after{
            width: 40px;
            background: rgba(179, 255, 210, 0.3);
            left: 60px;
            filter: blur(5px);
            opacity: 0;
        }

        button:hover::before{
            transition: 1s;
            transform: translateX(320px);
            opacity: 0.7;
        }
        button:hover::after {
            transition: 1s;
            transform: translateX(320px);
            opacity: 1;
        }
    </style>

</head>
<body>
<div class="box">
    <h2>管理员登录</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="inputBox">
            <input type="text" name="uid" id="uid" required="" autocomplete="off" onblur="check1()">
            <label>Username</label>
        </div>
        <div class="inputBox">
            <input type="password" name="upassword" id="upassword" required="" autocomplete="off" onblur="check2()">
            <label>password</label>
        </div>

        <button type="submit" id="submit">Submit</button>

        <div style="padding-top: 5px">
            <span id="Info" style="color: #2aabd2; margin-top: 10px; padding-left: 114px"></span>
        </div>

    </form>
</div>
<script>
    function check1() {
        if (document.getElementById('uid').value !== "") {
            jQuery.post({
                url :"${pageContext.request.contextPath}/checkUid",
                data: {"uid" : $("#uid").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#Info").html("");
                        document.getElementById("submit").disabled = false;
                    } else {
                        $("#Info").css("padding-left", "114px");
                        $("#Info").html(data);
                        document.getElementById("submit").disabled = true;
                    }
                }
            })
        }
    }
    function check2() {
        if (document.getElementById('upassword').value !== "") {
            jQuery.post({
                url: "${pageContext.request.contextPath}/checkUpassword",
                data: {
                    "uid": $("#uid").val(), "upassword": $("#upassword").val()
                },
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#Info").html("");
                        document.getElementById("submit").disabled = false;
                    } else {
                        $("#Info").css("padding-left", "129px");
                        $("#Info").html(data);
                        document.getElementById("submit").disabled = true;
                    }
                }
            })
        }
    }
</script>
</body>
</html>