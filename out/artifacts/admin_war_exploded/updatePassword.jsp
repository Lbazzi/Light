<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/personalUpdate.css"/>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <style>
        .topbar-inner {
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
    </style>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner" style="width: 100%; height: 50px"></div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h3 style="font-size: 18px">Lights 后台管理</h3>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <ul class="sub-menu">
                        <li style="text-align: center; font-size: 17px"><a href="${pageContext.request.contextPath}/userList">用户管理</a></li>
                        <li style="text-align: center; font-size: 17px"><a href="${pageContext.request.contextPath}/productList">商品管理</a></li>
                        <li style="text-align: center; font-size: 17px"><a href="${pageContext.request.contextPath}/orderList">订单管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-wrap">
        <div style="height: 47px; background: #F2F2F3;">
            <span style="float: left;font-size: 18px;margin-left: 12px;margin-top: 10px;">
                管理员：${sessionScope.admin.uname}
            </span>
            <span style="float: right;font-size: 18px;margin-top: 10px;margin-right: 14px;">
                <a href="${pageContext.request.contextPath}/signOut"> 退出登录</a>
            </span>
            <span style="float: right;font-size: 18px;margin-top: 10px;">
                <a href="${pageContext.request.contextPath}/updatePassword.jsp">修改密码 |&nbsp;</a>
            </span>
        </div>
        <div class="crumb-wrap">
            <div class="crumb-list" style="font-size: 17px">
                <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                <span class="crumb-step">&gt;</span>
                <span class="crumb-name">修改密码</span>
            </div>
        </div>
        <div style="margin-top: 50px;">
            <form action="${pageContext.request.contextPath}/updateUserByPassword" method="post" class="remima">
                <p>
                    <span>原密码：</span>
                    <input type="text" name="oldPassword" placeholder="请输入原密码" id="oldPassword" onblur="checkOldPassword()" required/>
                    <span id="passwordInfo" style="width: 77px;"></span>
                </p>
                <p class="op"></p>
                <p>
                    <span>新密码：</span>
                    <input type="text" name="newPassword" placeholder="请输入新密码" id="newPassword" onblur="check2()" required/>
                    <span id="check2Info" style="width: 192px;"></span>
                </p>
                <p class="op">6-16 个字符，需使用字母、数字或符号组合，不能使用纯数字、纯字母、纯符号</p>
                <p>
                    <span>重复新密码：</span>
                    <input type="text" name="conformPassword" placeholder="请再次输入密码" id="conformPassword" onblur="check()" required/>
                    <span id="tishi" style="color: red"></span>
                </p>
                <input type="submit" value="提交" id="submit" style="margin-left: 143px;height: 40px;border: none;width: 70px;"/>
            </form>
        </div>
    </div>
</div>
<script>
    function check() {
        if (document.getElementById("conformPassword").value !== "") {
            if (document.getElementById("newPassword").value == document.getElementById("conformPassword").value) {
                document.getElementById("tishi").innerHTML = "";
                document.getElementById("submit").disabled = false;
                return true;
            } else {
                document.getElementById("tishi").innerHTML = "两次密码不一致";
                document.getElementById("submit").disabled = true;
            }
        }
    }
    //新密码与原密码不应该一样
    function check2() {
        jQuery.post({
            url: "${pageContext.request.contextPath}/checkTwoPassword",
            data: {"password":$("#newPassword").val()},
            success: function (data) {
                if (data.toString() === 'ok') {
                    $("#check2Info").html("");
                } else {
                    $('#check2Info').css("color", "red");
                    $("#check2Info").html(data);
                }
            }
        })
    }
    function checkOldPassword() {
        if (document.getElementById("oldPassword").value !== "") {
            jQuery.post({
                url: "${pageContext.request.contextPath}/queryUserPassword",
                data: {"password":$("#oldPassword").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#passwordInfo").html("");
                    } else {
                        $('#passwordInfo').css("color", "red");
                        $("#passwordInfo").html(data);
                    }
                }
            })
        }
    }
</script>
</body>
</html>