<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/proList.css" />
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/carTable.js"></script>
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
    <div class="address" style="margin-bottom: 20px">
        <div class="wrapper clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp" style="font-size: 18px">首页</a>
            <span>/</span>
            <font style="color: #777; font-size: 18px">购物车</font>
        </div>
    </div>
    <c:if test="${not empty cars}">
        <form action="${pageContext.request.contextPath}/deleteSelectedCar" id="myForm" method="post">
            <div class="table wrapper" style="width: 1098px">
                <div class="tr">
                    <div class>商品信息</div>
                    <div class>单价</div>
                    <div>数量</div>
                    <div>金额</div>
                    <div>操作</div>
                </div>
                <c:forEach var="car" items="${cars}">
                    <div class="th">
                        <div class="pro clearfix">
                            <label class="fl">
                                <input name="cids" value="${car.cid}" type="checkbox"><span></span>
                            </label>
                            <a class="fl" href="${pageContext.request.contextPath}/queryProductByPid?pid=${car.product.pid}">
                                <dl class="clearfix">
                                    <dt class="fl"><img style="width: 100px; height: 100px" src="${pageContext.request.contextPath}/statics/img/product/${car.product.picture}"></dt>
                                    <dd class="fl" style="margin-top: 25px;border: 0px">
                                        <p>${car.product.pname}</p>
                                        <p>商品分类：${car.product.pclass}</p>
                                    </dd>
                                </dl>
                            </a>
                        </div>
                        <div class="price" style="text-align: center">￥${car.product.price}0</div>
                        <div class="number">
                            <p class="num clearfix">
                                <img class="fl sub" src="${pageContext.request.contextPath}/statics/img/corner/sub.jpg">
                                <span datasrc="${car.product.pid}" class="fl">${car.quantity}</span>
                                <img class="fl add" src="${pageContext.request.contextPath}/statics/img/corner/add.jpg">
                            </p>
                        </div>
                        <div class="price sAll" style="text-align: center">￥${car.product.price * car.quantity}0</div>
                        <div class="price" style="text-align: center">
                            <a class="link-del" href="javascript:Delete('你确定删除该商品吗？', '${pageContext.request.contextPath}/deleteCar?cid=${car.cid}')">删除</a>
                        </div>
                    </div>
                </c:forEach>

                <div class="tr clearfix">
                    <label class="fl">
                        <input class="allChoose" onclick="selall(this)" type="checkbox"><span></span>
                    </label>
                    <p class="fl">
                        <a href="#">全选</a>
                        <a href="javascript:delmore('你确定删除这些商品吗？', 'myForm')" class="del">删除</a>
                    </p>
                    <p class="fr" style="float: right">
                        <span>共<small id="sl">0</small>件商品</span><span>合计:&nbsp;<small id="all">￥0.00</small></span>
                        <a href="javascript:jie()" class="count">结算</a>
                    </p>
                </div>
            </div>
        </form>
        <!-- Footer -->
        <footer class="footer">
            <div class="footer-inner" style="background: #F5F5F6; ">
                <div style="font-size: 15px;padding-left: 25px;">From：肇庆学院</div>
                <div style="font-size: 15px">Author：陈伟得、易炫华、黄恒锌</div>
                <div style="font-size: 15px;padding-right: 25px;">Time：2021.6.8</div>
            </div>
        </footer>
    </c:if>
    <c:if test="${empty cars}">
        <a href="${pageContext.request.contextPath}/index.jsp"><h1 style="padding-top: 30px; ">购物车空空如也，去首页逛逛吧></h1></a>
    </c:if>

</div>
<script>
    function jie() {
        let str = "";
        $("input[name='cids']:checked").each(function (index, item) {
            if ($("input[name='cids']:checked").length - 1 == index) {
                str += $(this).val();
            } else {
                str += $(this).val() + ",";
            }
        });
        location.href = "${pageContext.request.contextPath}/toOrder?cids=" + str;
    }
    function Delete(mess, url) {
        if(confirm(mess)) {
            location.href = url;
        }
    }
    function selall(o) {
        var a = document.getElementsByName('cids');
        for(var i=0; i<a.length; i++) {
            a[i].checked = o.checked;
        }
    }

    function delmore(mess, formName) {
        let length = $("input[type='checkbox']:checked").length;
        if (length !== 0) {
            if(confirm(mess)) {
                var form = document.getElementById(formName);
                form.submit();
            }
        }
    }
</script>
</body>
</html>