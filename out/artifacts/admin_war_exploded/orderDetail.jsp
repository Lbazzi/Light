<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单列表</title>
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
        <div class="crumb-wrap">
            <div class="crumb-list" style="font-size: 17px">
                <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                <span class="crumb-step">&gt;</span>
                <span class="crumb-name">订单管理</span>
                <span class="crumb-step">&gt;</span>
                <span class="crumb-name">订单详情</span>
            </div>
        </div>

        <div id="register" class="result-wrap">
            <div>
                <div style="width: 50%;height: 100%; float:left;">
                    <div style="padding-left: 10px; padding-top: 10px;">
                        <h1 style="font-size: 18px">订单号：${orderDetail.oid}</h1>
                        <h1 style="font-size: 18px; padding-top: 10px">订单状态：
                            <c:if test="${('3'.equals(orderDetail.ostatus))}">已收货</c:if>
                            <c:if test="${('0'.equals(orderDetail.ostatus))}">未付款</c:if>
                            <c:if test="${('1'.equals(orderDetail.ostatus))}">未发货</c:if>
                            <c:if test="${('2'.equals(orderDetail.ostatus))}">未收货</c:if>
                        </h1>
                    </div>
                    <div style="margin-top: 40px; padding-left: 10px;">
                        <h1 style="font-size: 18px; padding-bottom: 10px">订单商品如下：</h1>

                        <div>
                            <c:forEach var="product" items="${orderDetail.orderProducts}">
                                <div style="padding-bottom: 20px; width: 100%; height: 240px">
                                    <div style="float:left;">
                                        <img src="${pageContext.request.contextPath}/statics/img/product/${product.product.picture}" style="width: 240px; height: 240px"/>
                                    </div>
                                    <div style="float: left; padding-left: 10px">
                                        <h1 style="font-size: 18px">商品名称：${product.product.pname}</h1>
                                        <h1 style="font-size: 18px">商品规模：¥${product.product.price} × ${product.quantity}</h1>
                                        <h1 style="font-size: 18px">小计：${product.product.price * product.quantity}</h1>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                </div>
                <div style=" width:45%; height:100%; float: right">
                    <div style="padding-left: 10px; padding-top: 10px;">
                        <h1 style="font-size: 18px;padding-bottom: 10px">收货信息如下：</h1>
                        <div style=" border:1px solid #ffcc00;background:#fffff7; height: 150px; width: 400px">
                            <p style="font-size: 15px; padding: 20px 10px 10px 10px"><span>收件人：${orderDetail.user.uname}</span></p>
                            <p style="font-size: 15px; padding: 10px 10px 10px 10px"><span>联系电话:${orderDetail.user.uphone}</span></p>
                            <p style="font-size: 15px; padding: 10px 10px 10px 10px"><span>收货地址：${orderDetail.user.uaddress}</span></p>
                            <br/><br/>
                        </div>
                    </div>
                    <hr style="margin-top: 20px">
                    <div style="margin-top: 20px; padding-left: 10px;">
                        <h1 style="font-size: 20px;padding-bottom: 10px">支付方式及送货时间：</h1>
                        <h1 style="font-size: 15px;padding-bottom: 10px">支付方式：在线支付</h1>
                        <h1 style="font-size: 15px;padding-bottom: 10px">送货时间：不限送货时间</h1>
                    </div>
                    <hr>
                    <div style="margin-top: 20px; padding-left: 10px;">
                        <h1 style="font-size: 20px;padding-bottom: 10px">商品总价：¥${orderDetail.oprice}</h1>
                        <h1 style="font-size: 20px;padding-bottom: 10px">运费：¥0.00</h1>
                        <h1 style="font-size: 20px;padding-bottom: 10px">订单金额：¥${orderDetail.oprice}</h1>
                        <h1 style="font-size: 20px;padding-bottom: 10px">实付金额：¥${orderDetail.oprice}</h1>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>