<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的订单</title>
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
                    <input type="text" placeholder="搜索商品" id="search" style="outline-style: none;border: 1px solid #ccc;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;">
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
            <font style="color: #777; font-size: 18px">我的订单</font>

        </div>
    </div>
    <div style="height: 90px">
        <div style="width:40%; float: left">
            <h1 style="font-size: 34px;padding: 0 0 2px;margin: .67em 0;">我的订单</h1>
        </div>
        <div style="width:40%; height:90px;float: right; font-size: 18px">
            <div style="margin-top: 61px; margin-left: 49px;">
                <a href="${pageContext.request.contextPath}/queryOrderByUid">全部订单</a>&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/queryOrderByOstatus?ostatus=0">未付款</a>&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/queryOrderByOstatus?ostatus=1">未发货</a>&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/queryOrderByOstatus?ostatus=2">未收货</a>&nbsp;&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/queryOrderByOstatus?ostatus=3">已完成</a>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
    </div>

    <div class="Bott">
        <div class="wrapper clearfix">
            <div class="you fl">
                <c:forEach var="order" items="${list}">
                    <div class="dkuang">
                        <div style="border-bottom: 1px solid rgb(242, 242, 242); height: 45px">
                            <strong>
                                <p style="float:left; color: #666; font-size: 15px; padding-top: 10px; padding-left: 10px;">订单编号：${order.oid}</p>
                            </strong>
                            <strong>
                                <p style="float: right;color: #666; font-size: 15px; padding-top: 10px; padding-right: 10px">${order.otime}</p>
                            </strong>
                        </div>
                        <c:forEach var="product" items="${order.orderProducts}" varStatus="status">
                            <div class="shohou clearfix">
                                <div style="width: 100px; height:100px; float: left">
                                    <a href="#" class="fl">
                                        <img src="${pageContext.request.contextPath}/statics/img/product/${product.product.picture}" style="height: 100px; width: 100px"/>
                                    </a>
                                </div>
                                <div style="width: 50%; height:100px; float: left; margin-left: 15px">
                                    <h2>商品名称：${product.product.pname}</h2>
                                    <h3>单价：${product.product.price}</h3>
                                    <h3>数量：${product.quantity}</h3>
                                    <h3>小计：${product.quantity * product.product.price}</h3>
                                </div>
                                <c:if test="${status.last}">
                                    <div style="width: 20%;height:100px;float: right;">
                                        <p class="fr">
                                            <c:if test="${('0'.equals(order.ostatus))}">
                                                <a href="${pageContext.request.contextPath}/topay?oid=${order.oid}" style="margin-bottom: 5px">立即支付</a>
                                            </c:if>
                                            <c:if test="${('1'.equals(order.ostatus))}">
                                                <a disabled="true" style="margin-bottom: 5px">未发货</a>
                                            </c:if>
                                            <c:if test="${('2'.equals(order.ostatus))}">
                                                <a href="${pageContext.request.contextPath}/updateOrderByOstatus?ostatus=3&oid=${order.oid}">确认收货</a>
                                            </c:if>
                                            <c:if test="${('3'.equals(order.ostatus))}">
                                                <a href="" disabled="true">已完成</a>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/queryOrderByOid?oid=${order.oid}" style="margin-bottom: 5px">订单详情</a>
                                            <c:if test="${'0'.equals(order.ostatus) || '1'.equals(order.ostatus)}">
                                                <a href="${pageContext.request.contextPath}/deleteOrderByOid?oid=${order.oid}">取消订单</a>
                                            </c:if>
                                        </p>
                                    </div>
                                </c:if>

                            </div>
                            <hr style="margin-top: -12px;margin-left: 30px;margin-right: 30px;border-top: 1px rgba(0,0,0,.1);color: RGB(242, 242, 242);">
                        </c:forEach>
                        <div style="height:30px; padding-top: 5px; margin-top: 5px; margin-left:30px; margin-right:30px; margin-bottom: 10px">
                            <span style="float:left; font-size: 15px; font-weight: bold">支付方式：在线支付</span>
                            <span style="float: right; font-size: 15px; font-weight: bold">总计:
                                <span style="color: red">￥${order.oprice}</span>
                            </span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
<%--        <div>&nbsp;</div>--%>
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


