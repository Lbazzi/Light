<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/personal.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/personalUpdate.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>

    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/personal.js"></script>
    <script>
        function search() {
            let value = document.getElementById(`search`).value;
            if (value != null && value !== '') {
                location.href = "${pageContext.request.contextPath}/queryProductByPname?pname=" + value;
            }
        }
        function person() {
            if (${sessionScope.user == null}) {
                location.href = "${pageContext.request.contextPath}/login.jsp";
            } else {
                location.href = "${pageContext.request.contextPath}/personal.jsp";
            }
        }
    </script>
</head>
<body>

<div class="container">
    <nav class="main-nav">
        <img src="${pageContext.request.contextPath}/statics/img/logo.png" alt="Microsoft" class="logo">
        <ul class="main-menu" style="font-size: 15px">
            <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/queryOrderByUid">我的订单</a></li>
            <li><a href="${pageContext.request.contextPath}/passwordUpdate.jsp">修改密码</a></li>
            <li><a href="${pageContext.request.contextPath}/personalUpdate.jsp">修改个人信息</a></li>

            <li><a href="${pageContext.request.contextPath}/signOut">退出登录</a></li>
        </ul>
        <ul class="right-menu">
            <li>
                <a class="sss">
                    <input type="text" placeholder="搜索商品" required id="search" style="outline-style: none;border: 1px solid #ccc;padding:4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;">
                </a>
            </li>
            <li><a href="javascript:search()"><i class="fa fa-search" style="font-size: 20px"></i></a></li>
            <li><a href="${pageContext.request.contextPath}/carList"><i class="fa fa-shopping-cart" style="font-size: 20px"></i></a></li>
            <li><a href="javascript:person()"><i class="fa fa-user" style="font-size: 20px"></i></a></li>
        </ul>
    </nav>
    <div class="address">
        <div class="wrapper clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp" style="font-size: 18px">首页</a>
            <span>/</span>
            <font style="color: #777; font-size: 18px">个人中心</font>
        </div>
    </div>

    <h1 style="font-size: 34px;padding: 0 0 2px;margin: .67em 0;">个人中心</h1>

    <div class="Bott" >
        <div class="wrapper clearfix">
            <div class="you fl">
                <div class="gxin">
                    <div class="xx">
                        <h3 class="clearfix">
                            <strong class="fl">基础资料</strong>
                            <a href="${pageContext.request.contextPath}/personalUpdate.jsp" class="fr" id="edit1" style="font-size: 16px">编辑</a>
                        </h3>
                        <div>用户名：${sessionScope.user.uname}</div>
                        <div>电子邮箱：${sessionScope.user.uemail}</div>
                        <div>性别：${sessionScope.user.ugender}</div>
                        <div>电话：${sessionScope.user.uphone}</div>
                        <div>地址：${sessionScope.user.uaddress}</div>
                        <h3>高级设置</h3>
                        <div>
                            <span class="fl">密码：*******</span>
                            <a href="${pageContext.request.contextPath}/passwordUpdate.jsp" class="fr" id="edit2">修改</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-inner" style="background: #F5F5F6; ">
            <div style="font-size: 15px;padding-left: 25px;">From：肇庆学院</div>
            <div style="font-size: 15px">Author：陈伟得、易炫华、黄恒锌</div>
            <div style="font-size: 15px;padding-right: 25px;">Time：2021.6.8</div>
        </div>
    </footer>
</div>
</body>
</html>