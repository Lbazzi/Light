<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详细页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/proList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/carTable.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/productDetail.js"></script>
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
    <div class="address">
        <div class="wrapper clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp" style="font-size: 18px">首页</a><span>/</span>
            <a href="${pageContext.request.contextPath}/queryProductByPclass?pclass=${product.pclass}" style="font-size: 18px">${product.pclass}</a><span>/</span>
            <font style="font-size: 18px; color: #777;">${product.pname}</font>
        </div>
    </div>
<%--    <h1 style="font-size: 20px;padding: 0 0 2px;margin: .67em 0;">${pClass}</h1>--%>
    <div class="current"><div class="wrapper clearfix"><h2 class="fl">${product.pclass}</h2></div></div>

    <div class="detCon">
        <div class="proDet wrapper">
            <div class="proCon clearfix">
                <div class="proImg fl">
                    <%--展示商品图片--%>
                    <img class="det" src="${pageContext.request.contextPath}/statics/img/product/${product.picture}"/>
                    <div class="smallImg clearfix">
                        <img src="${pageContext.request.contextPath}/statics/img/product/${product.picture}" data-src="${pageContext.request.contextPath}/statics/img/product/${product.picture}">
                    </div>
                </div>
                <div class="fr intro">
                    <div class="title">
                        <h2>${product.pname}</h2><br/>
                        <p>${product.pdes}</p><br/>
                        <span>${product.price}</span>
                    </div>
                    <div class="proIntro">
                        <p>颜色分类</p>
                        <div class="smallImg clearfix categ">
                            <p class="fl" id="cla"><img src="${pageContext.request.contextPath}/statics/img/product/${product.picture}" alt="${product.pname}" data-src="${pageContext.request.contextPath}/statics/img/product/${product.picture}"></p>
                        </div>
                        <p>库存剩余：<span>${product.stock}</span> 件</p>
                        <div class="num clearfix">
                            <img class="fl sub" src="${pageContext.request.contextPath}/statics/img/corner/sub.jpg">
                            <span class="fl" id="count" contentEditable="true">1</span> （限购五件）
                            <img class="fl add" src="${pageContext.request.contextPath}/statics/img/corner/add.jpg">
                            <p class="please fl">请选择商品属性!</p>
                        </div>
                    </div>
                    <div class="btns clearfix">
                        <a href="#"><p class="buy fl">立即购买</p></a>
                        <a href="#"><p class="cart fr">加入购物车</p></a>
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

<script>
    $(".btns a").click(function () {
        if ($(".categ p").hasClass("on")) {
            //购买：添加到购物车，并跳转到购物车列表
            if ($(this).children().hasClass("buy")) {
                if (${sessionScope.user != null}) {
                    let count = document.getElementById("count").innerHTML; //.innerHTML 相当于一个数据容器，用来获取你得到的DOM元素里包含的所有数据
                    if (count > ${product.stock}) {
                        alert("超出库存，请重新选择");
                    } else {
                        //添加到购物车，传入购买的数量count、以及商品pid
                        $(this).attr("href", "${pageContext.request.contextPath}/addCar?pid=${product.pid}&count="+count+"&url=1")
                    }
                } else {
                    alert("请先登录");
                    $(this).attr("href", "${pageContext.request.contextPath}/login.jsp")
                }
            }

            //购物车：把商品加入购物车，然后返回首页
            if ($(this).children().hasClass("cart")) {
                if (${sessionScope.user != null}) {
                    //获取数量
                    let count = document.getElementById("count").innerHTML;

                    if (count > ${product.stock}) {
                        alert("超出库存，请重新选择");
                    } else {
                        //添加后返回主页
                        $(this).attr("href", "${pageContext.request.contextPath}/addCar?pid=${product.pid}&count="+count+"&url=2")
                        alert("添加成功！点击确定返回首页");
                    }
                } else {
                    alert("请先登录");
                    $(this).attr("href", "${pageContext.request.contextPath}/login.jsp")
                }

            }
            $(".proIntro").css("border", "none");
            $(".num .please").hide()
        } else {
            $(".proIntro").css("border", "1px solid #c10000");
            $(".num .please").show()
        }
    });
</script>
</body>
</html>
