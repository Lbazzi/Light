<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/personalUpdate.css"/>

    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/personal.js"></script>
    <style>
        input:focus{
            border-color: #66afe9;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
        }
    </style>
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
                    <input type="text" placeholder="搜索商品" required id="search" style="outline-style: none;border: 1px solid #ccc;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;">
                </a>
            </li>
            <li><a href="javascript:search()"><i class="fa fa-search" style="font-size: 20px"></i></a></li>
            <li><a href="${pageContext.request.contextPath}/carList"><i class="fa fa-shopping-cart" style="font-size: 20px"></i></a></li>
            <li><a href="javascript:person()"><i class="fa fa-user" style="font-size: 20px"></i></a></li>
        </ul>
    </nav>
    <div class="address">
        <div class="wrapper clearfix" style="font-size: 15px">
            <a href="${pageContext.request.contextPath}/index.jsp" class="fl" style="color: #777; font-size: 18px">首页</a>
            <span>/</span>
            <a href="${pageContext.request.contextPath}/personalUpdate.jsp" class="on" style="color: #777; font-size: 18px">个人信息</a><span>/</span>
            <font style="color: #777; font-size: 18px">修改个人信息</font>
        </div>
    </div>
    <h1 style="font-size: 34px;padding: 0 0 2px;margin: .67em 0;">修改个人信息</h1>
    <div class="Bott">
        <div class="wrapper clearfix">
            <div class="you fl">

                <form action="${pageContext.request.contextPath}/updateUser" method="post" class="remima">
                    <p>
                        <span>用户ID：</span>
                        <input type="text" name="uid" required value="${sessionScope.user.uid}">
                    </p>
                    <p>
                        <span>用户名：</span>
                        <input type="text" name="uname" required value="${sessionScope.user.uname}">
                    </p>
                    <p style="font-size: 18px">
                        <span>性别：</span>
                        <input type="radio" name="ugender" value="男" ${sessionScope.user.ugender=='男'?"checked":"" }>男&nbsp;&nbsp;
                        <input type="radio" name="ugender" value="女" ${sessionScope.user.ugender=='女'?"checked":"" }>女
                    </p>
                    <p>
                        <span>电子邮箱：</span>
                        <input type="text" name="uemail" required value="${sessionScope.user.uemail}">
                    </p>
                    <p>
                        <span>联系电话：</span>
                        <input type="text" name="uphone" required value="${sessionScope.user.uphone}">
                    </p>
                    <p>
                        <span>收货地址：</span>
                        <input type="text" name="uaddress" required value="${sessionScope.user.uaddress}">
                    </p>
                    <input type="submit" value="修改" style="display:block; width: 100px; height: 40px; background: rgb(193, 0, 0); color: #fff; border: none; float: left; margin-left: 143px; margin-top: 15px">
                    <input type="hidden" name="upassword" required value="${sessionScope.user.upassword}">
                    <input type="hidden" name="ustatus" required value="${sessionScope.user.ustatus}">
                </form>
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
