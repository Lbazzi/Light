<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简单通用文章系统后台管理模板</title>
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
        input[type=text] {
            padding-left: 10px;
            display: inline-block;
            width: 240px;
            height: 30px;
            line-height: 30px;
            border: 1px solid #E0E0E0;
            text-indent: 10px;
        }
        p {
            padding-bottom: 20px;
        }
        span {
            padding-left: 10px;
            display: inline-block;
            text-align: right;
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
                <a class="crumb-name" href="${pageContext.request.contextPath}/userList">商品管理</a>
                <span class="crumb-step">&gt;</span><span>修改商品信息</span></div>
        </div>


        <div class="result-wrap">
            <div class="result-content">
                <form action="${pageContext.request.contextPath}/updateProduct" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <div style="padding-top: 30px; padding-left: 30px">
                        <p style="padding-left: 72px">
                            <span style="">商品ID：</span>
                            <input name="pid" size="50" type="text" value="${product.pid}" required>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品名称：</span>
                            <input name="pname" size="50" type="text" value="${product.pname}" required>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品价格：</span>
                            <input name="price" size="50" type="text" value="${product.price}" required>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品库存：</span>
                            <input name="stock" size="50" type="text" value="${product.stock}" required>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品风格：</span>
                            <select class="common-text required" name="pclass">
                                <option>${product.pclass}</option>
                                <option>吸顶灯</option>
                                <option>台灯</option>
                                <option>落地灯</option>
                                <option>吊灯</option>
                                <option>壁灯</option>
                            </select>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品描述：</span>
                            <textarea name="pdes" rows="6" cols="60">${product.pdes}</textarea>
                        </p>
                        <p style="padding-left: 60px">
                            <span style="">商品图片：</span>
                            <img src="${pageContext.request.contextPath}/statics/img/product/${product.picture}" width="200" height="200">
                            <input type="hidden" name="picture" value="${product.picture}"/>
                            <input name="file" type="file">
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