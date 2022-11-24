<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/main.css"/>
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


        <div class="result-wrap">
            <div class="result-title"><h1>快捷操作</h1></div>
            <div class="result-content">
                <div class="short-wrap">
                    <a href="${pageContext.request.contextPath}/userAdd.jsp">新增用户</a>
                    <a href="${pageContext.request.contextPath}/productAdd.jsp">新增商品</a>
                </div>
            </div>
        </div>

        <div class="result-wrap">
            <div class="result-title"><h1>系统基本信息</h1></div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li><label class="res-lab">操作系统</label><span class="res-info">Windows</span></li>
                    <li><label class="res-lab">Author</label><span class="res-info">陈伟得、易炫华、黄恒锌</span></li>
                    <li><label class="res-lab">From</label><span class="res-info">肇庆学院</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>