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
            </div>
        </div>

        <div class="search-wrap">
            <div class="search-content">
                <form action="${pageContext.request.contextPath}/orderList" method="post">
                    <input class="common-text" name="oid" placeholder="订单编号" type="text" style="margin-left: 30px;outline-style: none;border: 1px solid #ccc;height: 29px;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;">
                    <input class="common-text" name="status" placeholder="订单状态" type="text" style="margin-left: 30px;outline-style: none;border: 1px solid #ccc;height: 29px;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;">
                    <input class="common-text" name="uname" placeholder="用户姓名" type="text" style="margin-left: 30px;outline-style: none;border: 1px solid #ccc;height: 29px;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;">
                    <input class="btn btn-primary btn2" name="sub" value="查询" type="submit" style="margin-left: 20px;background: #D0EEFF;border: 1px solid #99D3F5;border-radius: 4px;padding: 4px 12px;overflow: hidden;color: #1E88C7;text-decoration: none;text-indent: 0;line-height: 20px;">
                </form>
            </div>
        </div>

        <div id="register" class="result-wrap">
            <form action="${pageContext.request.contextPath}/" id="myForm" method="post">
                <div class="result-content">
                    <table class="result-tab" style="text-align:center !important; width: 100%">
                        <tr>
                            <th>订单编号</th>
                            <th>创建时间</th>
                            <th>订单金额</th>
                            <th>订单状态</th>
                            <th>用户信息</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach var="order" items="${pageInfo.list}">
                            <tr>
                                <td>${order.oid}</td>
                                <td>${order.otime}</td>
                                <td>${order.oprice}</td>
                                <td>
                                    <c:if test="${'0'.equals(order.ostatus)}">
                                        未付款
                                    </c:if>
                                    <c:if test="${'1'.equals(order.ostatus)}">
                                        未发货
                                    </c:if>
                                    <c:if test="${'2'.equals(order.ostatus)}">
                                        未收货
                                    </c:if>
                                    <c:if test="${'3'.equals(order.ostatus)}">
                                        已收货
                                    </c:if>
                                </td>
                                <td>
                                    用户名：${order.user.uname} <br/>
                                    联系电话：${order.user.uphone} <br/>
                                    收货地址：${order.user.uaddress}
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/queryOrderByOid?oid=${order.oid}" style="color: red">订单详情</a>
                                    <c:if test="${'1'.equals(order.ostatus)}">
                                        |
                                        <a href="${pageContext.request.contextPath}/updateOrderByOstatus?ostatus=2&oid=${order.oid}" style="color: deepskyblue">发货</a>
                                    </c:if>
                                </td>

                            </tr>
                        </c:forEach>
                    </table>
                    <div style="padding-top: 20px;">
                        <ul class="fenye">
                            <li><a href="javascript:before(${pageInfo.pageNum})" id="before"> < Prev  </a></li>
                            <li><a href="javascript:after(${pageInfo.pageNum}, ${pageInfo.pages})" id="after"> Next > </a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function before(page) {
        if (page - 1 < 1) {
            //不能往前翻
            document.getElementById('before').disable = true;
        } else {
            document.getElementById('before').disable = false;
            location.href = "${pageContext.request.contextPath}/orderList?startPage="+ (page - 1) + "&pageSize=5";
        }
    }
    function after(page, maxp) {
        if (page + 1 > maxp) {
            document.getElementById('after').disable = true;
        } else {
            document.getElementById('after').disable = false;
            location.href = "${pageContext.request.contextPath}/orderList?startPage=" + (page + 1) + "&pageSize=5";
        }
    }
</script>
</body>
</html>