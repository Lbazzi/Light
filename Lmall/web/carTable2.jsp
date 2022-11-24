<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单确认页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/main.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/personalUpdate.css"/>
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
            <li><a href="${pageContext.request.contextPath}/queryProductByPclass?pclass=吸顶灯">吸顶灯</a></li>
            <li><a href="${pageContext.request.contextPath}/queryProductByPclass?pclass=台灯">台灯</a></li>
            <li><a href="${pageContext.request.contextPath}/queryProductByPclass?pclass=落地灯">落地灯</a></li>
            <li><a href="${pageContext.request.contextPath}/queryProductByPclass?pclass=吊灯">吊灯</a></li>
            <li><a href="${pageContext.request.contextPath}/queryProductByPclass?pclass=壁灯">壁灯</a></li>
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
        <div class="wrapper clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp" style="font-size: 18px">首页</a>
            <span>/</span>
            <font style="font-size: 18px;color: #777">订单确认</font>
        </div>
    </div>

    <div class="Bott">
        <div class="wrapper clearfix">
            <div class="you fl" style="padding: 0; padding-top: 25px">
                <h1 style="font-size: 20px;padding: 0 0 2px;margin: .67em 0;">
                    收货地址如下：
                    <a style="float: right; color: #2aabd2" href="${pageContext.request.contextPath}/carList">返回购物车 ></a>
                </h1>
                <div style=" border:1px solid #ffcc00;background:#fffff7; height: 150px; width: 400px">
                    <p style="font-size: 15px; padding: 20px 10px 10px 10px"><span>收件人：${sessionScope.user.uname}</span></p>
                    <p style="font-size: 15px; padding: 10px 10px 10px 10px"><span>联系电话：${sessionScope.user.uphone}</span></p>
                    <p style="font-size: 15px; padding: 10px 10px 10px 10px"><span>收货地址：${sessionScope.user.uaddress}</span></p>

                    <br/><br/>
                </div>
                <br/>
                <h1 style="font-size: 20px;padding: 0 0 2px;margin: .67em 0;padding-top: 20px;">
                    订单详情如下：
                </h1>
                <form action="${pageContext.request.contextPath}/addOrder?cids=${cids}" id="myForm" method="post">
                    <div class="result-content">
                        <table class="result-tab" style="text-align:center !important; width: 100%">
                            <tr>
                                <th>商品名</th>
                                <th>商品图片</th>
                                <th>商品种类</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>订单金额</th>
                            </tr>
                            <c:forEach var="car" items="${list}">
                                <input type="hidden" name="cids" value="${car.cid}">
                                <tr>
                                    <td>${car.product.pname}</td>
                                    <th><img src="${pageContext.request.contextPath}/statics/img/product/${car.product.picture}" width="150" height="150" alt=""></th>
                                    <td>${car.product.pclass}</td>
                                    <td>${car.product.price}</td>
                                    <td>${car.quantity}</td>
                                    <td>${car.quantity * car.product.price}</td>
                                </tr>
                            </c:forEach>
                        </table>
                        <br/>
                        <input type="submit" value="提交订单" style="display:block; width: 100px; height: 40px; background: rgb(193, 0, 0); color: #fff; border: none; float: right">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <footer class="footer" style="padding-top: 38px;background: none;">
        <div class="footer-inner" style="background: #F5F5F6; !important;">
            <div style="font-size: 15px;padding-left: 25px;">From：肇庆学院</div>
            <div style="font-size: 15px">Author：陈伟得、易炫华、黄恒锌</div>
            <div style="font-size: 15px;padding-right: 25px;">Time：2021.6.8</div>
        </div>
    </footer>
</div>
</body>
</html>
