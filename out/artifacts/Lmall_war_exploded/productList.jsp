<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
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
            <li><a class="sss"><input type="text" placeholder="搜索商品" required id="search" style="outline-style: none;border: 1px solid #ccc;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;"></a></li>
            <li><a href="javascript:search()"><i class="fa fa-search" style="font-size: 20px"></i></a></li>
            <li><a href="${pageContext.request.contextPath}/carList"><i class="fa fa-shopping-cart" style="font-size: 20px"></i></a></li>
            <li><a href="javascript:person()"><i class="fa fa-user" style="font-size: 20px"></i></a></li>
        </ul>
    </nav>

    <div class="address" >
        <div class="wrapper clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp" style="font-size: 18px">首页</a><span>/</span>
            <c:if test="${!pclass.equals(null)}">
                <font style="font-size: 18px;color: #777;">${pclass}</font>
            </c:if>
            <c:if test="${!pname.equals(null)}">
                <font style="font-size: 18px;color: #777;">${pname}</font>
            </c:if>
        </div>
    </div>

    <c:if test="${empty pageInfo.list}">
        <h1 style="font-size: 20px;padding: 0 0 2px;margin: .67em 0;">查无此产品</h1>
    </c:if>
    <section class="home-cards" style="margin-top: 10px;">
        <c:forEach var="product" items="${pageInfo.list}">
            <div>
                <a href="${pageContext.request.contextPath}/queryProductByPid?pid=${product.pid}">
                    <img src="${pageContext.request.contextPath}/statics/img/product/${product.picture}">
                </a>
                <h3>${product.pname}</h3>
                <h4>￥${product.price}</h4>
                <p>${product.pdes}</p>
                <a href="${pageContext.request.contextPath}/queryProductByPid?pid=${product.pid}">Learn More <i class="fa fa-chevron-right"></i></a>
            </div>
        </c:forEach>
    </section>
    <c:if test="${not empty pageInfo.list}">
        <div style="padding-top: 20px;">
            <ul class="fenye">
                <li><a href="javascript:before(${pageInfo.list.getPageNum()})" id="before"> < Prev  </a></li>
                <li><a href="javascript:after(${pageInfo.list.getPageNum()}, ${pageInfo.list.getPages()})" id="after"> Next > </a></li>
            </ul>
        </div>
    </c:if>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-inner" style="background: #F5F5F6; ">
            <div style="font-size: 15px;padding-left: 25px;">From：肇庆学院</div>
            <div style="font-size: 15px">Author：陈伟得、易炫华、黄恒锌</div>
            <div style="font-size: 15px;padding-right: 25px;">Time：2021.6.8</div>
        </div>
    </footer>
</div>
<script>
    function before(page) {
        if (page - 1 < 1) {
            //不能往前翻
            document.getElementById('before').disable = true;
        } else {
            document.getElementById('before').disable = false;
            if (${pname != null}) {
                location.href = "${pageContext.request.contextPath}/queryProductByPname?pname=${pname}&startPage="+ (page - 1) + "&pageSize=12";
            } else {
                location.href = "${pageContext.request.contextPath}/queryProductByPclass?pclass=${pclass}&startPage="+ (page - 1) + "&pageSize=12";
            }
        }
    }
    function after(page, maxp) {
        if (page + 1 > maxp) {
            document.getElementById('after').disable = true;
        } else {
            document.getElementById('after').disable = false;
            if (${pname != null}) {
                location.href = "${pageContext.request.contextPath}/queryProductByPname?pname=${pname}&startPage="+ (page + 1) + "&pageSize=12";
            } else {
                location.href = "${pageContext.request.contextPath}/queryProductByPclass?pclass=${pclass}&startPage=" + (page + 1) + "&pageSize=12";
            }
        }
    }
</script>
</body>
</html>
