<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/myorder.css"/>
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
    <!-- Nav -->
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
        <div class="wrapper clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp" style="font-size: 18px">首页</a><span>/</span>
            <a href="${pageContext.request.contextPath}/personal.jsp" style="font-size: 18px">个人中心</a><span>/</span>
            <a href="${pageContext.request.contextPath}/queryOrderByUid" style="font-size: 18px">我的订单</a><span>/</span>
            <font style="font-size: 18px; color: #777">
                订单详情
            </font>

        </div>
    </div>
    <h1 style="font-size: 34px;padding: 0 0 2px;margin: .67em 0;">订单详情</h1>

    <div class="Bott">
        <div class="wrapper clearfix">
            <div class="you fl">
                <div class="my clearfix">
                    <h3>订单号：${orderDeatil.oid}<span></span></h3>
                </div>

            <div class="orderList">
                <div class="orderList1">
                    <c:if test="${('3'.equals(orderDeatil.ostatus))}">
                        <h3 style="color: red; font-size: 18px">已收货</h3>
                    </c:if>
                    <c:if test="${('0'.equals(orderDeatil.ostatus))}">
                        <h3 style="color: red; font-size: 18px">未付款</h3>
                    </c:if>
                    <c:if test="${('1'.equals(orderDeatil.ostatus))}">
                        <h3 style="color: red; font-size: 18px">未发货</h3>
                    </c:if>
                    <c:if test="${('2'.equals(orderDeatil.ostatus))}">
                        <h3 style="color: red; font-size: 18px">未收货</h3>
                    </c:if>

                    <c:forEach var="product" items="${orderDeatil.orderProducts}">
                        <div class="clearfix">
                            <a href="${pageContext.request.contextPath}/queryProductByPid?pid=${product.product.pid}" class="fl" >
                                <img src="${pageContext.request.contextPath}/statics/img/product/${product.product.picture}" style="width: 240px; height: 240px"/>
                            </a>
                            <p style="font-size: 20px; color: black; font-weight: bold">${product.product.pname}</p>
                            <p style="font-size: 20px; color: black; font-weight: bold">¥${product.product.price} × ${product.quantity}</p>
                            <p style="font-size: 20px; color: black; font-weight: bold">小计：${product.product.price * product.quantity}</p>
                        </div>
                    </c:forEach>
                </div>

                <div class="my clearfix">
                    <h3>收货信息<span></span></h3>
                </div>

                <div style=" border:1px solid #ffcc00;background:#fffff7; height: 150px; width: 400px">
                    <p style="font-size: 15px; padding: 20px 10px 10px 10px"><span>收件人：${sessionScope.user.uname}</span></p>
                    <p style="font-size: 15px; padding: 10px 10px 10px 10px"><span>联系电话:${sessionScope.user.uphone}</span></p>
                    <p style="font-size: 15px; padding: 10px 10px 10px 10px"><span>收货地址：${sessionScope.user.uaddress}</span></p>
                    <br/><br/>
                </div>

                <div class="orderList1">
                    <div class="my clearfix">
                        <h3>支付方式及送货时间<span></span></h3>
                    </div>

                    <p>支付方式：<span>在线支付</span></p>
                    <p>送货时间：<span>不限送货时间</span></p>
                </div>

                <div class="orderList1 hei">
                    <h3><strong>商品总价：</strong><span>¥${orderDeatil.oprice}</span></h3>
                    <p><strong>运费：</strong><span>¥0</span></p>
                    <p><strong>订单金额：</strong><span>¥${orderDeatil.oprice}</span></p>
                    <p><strong>实付金额：</strong><span>${orderDeatil.oprice}</span></p>
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
