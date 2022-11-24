<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改商品</title>
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
        body.fenye {
            margin: 0;
            padding: 0;
        }
        /*分页*/
        ul.fenye {
            margin-top: 30px;
            height: 40px;
            width: 240px;
            transform: translate(-50%,-50%);
            display:flex;
            float: right;
            margin-right: -120px;
            padding: 0;
            border:1px solid #262626;
        }
        ul.fenye li {
            list-style:none;
            /*pointer-events: none;*/
        }
        ul.fenye li a {
            position: relative;
            display: block;
            width: 120px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            color: #262626;
            text-transform: uppercase;
            text-decoration: none;
            font-family: verdana;
            letter-spacing: 2px;
            overflow: hidden;
            transition: .5s;
        }
        ul.fenye li a:hover {
            color: #fff;
        }
        ul.fenye li a:before {
            content: '';
            position: absolute;
            top: 0;
            width: 100%;
            height: 100%;
            background: #262626;
            z-index: -1;
            transition: .5s;
        }
        ul.fenye li:nth-child(odd) a:before {
            right: -100%;
        }
        ul.fenye li:nth-child(even) a:before {
            left: -100%;
        }
        ul.fenye li:nth-child(odd) a:hover:before {
            right: 0%;
        }
        ul.fenye li:nth-child(even) a:hover:before {
            left: 0%;
        }
        p {
            padding-bottom: 20px;
        }
        span {
            padding-left: 10px;
            display: inline-block;
            text-align: right;
        }

        input[type=text] {
            padding-left: 10px;
            display: inline-block;
            width: 240px;
            height: 30px;
            line-height: 30px;
            border: 1px solid #E0E0E0;
            text-indent: 10px;
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
            <span style="float: left;font-size: 18px;margin-left: 2px;margin-top: 10px;">
                管理员：${sessionScope.admin.uname}
            </span>
            <span style="float: right;font-size: 18px;margin-top: 10px;margin-right: 14px;">
                <a href="${pageContext.request.contextPath}/signOut"> 退出登录</a>
            </span>
            <span style="float: right;font-size: 18px;margin-top: 10px;margin-right: -10px;">
                <a href="${pageContext.request.contextPath}/updatePassword.jsp">修改密码 |&nbsp;</a>
            </span>
        </div>
        <div class="crumb-wrap">
            <div class="crumb-list" style="font-size: 17px">
                <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                <span class="crumb-step">&gt;</span>
                <a class="crumb-name" href="user.jsp">商品管理</a>
                <span class="crumb-step">&gt;</span><span>新增商品</span>
            </div>
        </div>

        <div class="result-wrap">
            <div class="result-content">
                <form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data" id="myform" name="myform">
                    <div style="padding-top: 30px; padding-left: 30px">
                        <p style="padding-left: 60px">
                            <span style="">商品名称：</span>
                            <input name="pname" size="50" type="text" placeholder="请输入商品名称" required>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品分类：</span>
                            <select class="common-text required" name="pclass">
                                <option>请选择商品种类</option>
                                <option>吸顶灯</option>
                                <option>台灯</option>
                                <option>落地灯</option>
                                <option>吊灯</option>
                                <option>壁灯</option>
                            </select>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品图片：</span>
                            <input name="file" type="file">
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品价格：</span>
                            <input name="price" size="50" type="text" placeholder="请输入商品价格" required>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品描述：</span>
                            <textarea name="pdes" rows="6" cols="60" placeholder="请输入商品描述"></textarea>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品库存：</span>
                            <input name="stock" size="50" type="text" placeholder="请输入商品库存" required>
                        </p>
                        <input value="提交" type="submit" style="width: 111px;height: 40px;background: #A10000;border: none;color: #fff;margin-left: 143px;padding-left: 2px;">
                        <input onClick="history.go(-1)" value="返回" type="button" style="width: 111px;height: 40px;background: #A10000;border: none;color: #fff;margin-left: 19px;padding-left: 2px;">

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>