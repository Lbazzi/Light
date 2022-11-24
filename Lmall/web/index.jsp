<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/font-awesome-4.7.0/css/font-awesome.css"/>
    <script>
        function search() {
            let value = document.getElementById(`search`).value;
            if (value != null && value !== '') {
                location.href = "${pageContext.request.contextPath}/queryProductByPname?pname=" + value;
            }
        }
        document.querySelector('.menu-btn').addEventListener('click', () => document.querySelector('.main-menu').classList.toggle('show'));
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
<div class="menu-btn"><i class="fas fa-bars fa-2x"></i></div>
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
            <li><a class="sss"><input type="text" placeholder="搜索商品" id="search" required style="outline-style: none;border: 1px solid #ccc;padding: 4px 11px;width: 142px;font-size: 15px;font-weight: 500;margin-top: -2px;"></a></li>
            <li><a href="javascript:search()"><i class="fa fa-search" style="font-size: 20px"></i></a></li>
            <li><a href="${pageContext.request.contextPath}/carList"><i class="fa fa-shopping-cart" style="font-size: 20px"></i></a></li>
            <li><a href="javascript:person()"><i class="fa fa-user" style="font-size: 20px"></i></a></li>
        </ul>
    </nav>
    <header class="showcase"></header>

    <!-- Home cards 1 -->
    <section class="home-cards">
        <div>
            <figure class="sample">
                <img src="${pageContext.request.contextPath}/statics/img/8.png" alt="">
                <figcaption>
                    <h3>Read More</h3>
                </figcaption>
                <a href="#"></a>
            </figure>
            <h3>New Residential Lamp 7</h3>
            <p>The lamps and lanterns are made by glass. work.It has the quartz to make the decoration .Many light bulbs have composed heart shape</p>
            <a href="#">Learn More <i class="fa fa-chevron-right"></i></a>
        </div>
        <div>
            <figure class="sample">
                <img src="${pageContext.request.contextPath}/statics/img/15.png" alt="" />
                <figcaption>
                    <h3>Read More</h3>
                </figcaption>
                <a href="#"></a>
            </figure>
            <h3>New Wall Lamp 3</h3>
            <p>
                Express yourself powerfully with a thin, light, and elegant design,
                faster performance, and up to 11.5 hours battery life.
            </p>
            <a href="#">Learn More <i class="fa fa-chevron-right"></i></a>
        </div>
        <div>
            <figure class="sample">
                <img src="${pageContext.request.contextPath}/statics/img/10.png" alt="" />
                <figcaption>
                    <h3>Read More</h3>
                </figcaption>
                <a href="#"></a>
            </figure>

            <h3>Save $150 + free Table Lamp</h3>
            <p>
                Buy an Xbox One X console and double your fun with a free select
                extra controller. Starting at $349.
            </p>
            <a href="#">Learn More <i class="fa fa-chevron-right"></i></a>
        </div>
        <div>
            <figure class="sample">
                <img src="${pageContext.request.contextPath}/statics/img/16.png" alt="" />
                <figcaption>
                    <h3>Read More</h3>
                </figcaption>
                <a href="#"></a>
            </figure>

            <h3>New Pendant Lamp</h3>
            <p>
                Expect more. World class performance, with more privacy, more
                productivity, and more value.
            </p>
            <a href="#">Learn More <i class="fa fa-chevron-right"></i></a>
        </div>
    </section>
    <section class="xbox"><div class="content"></div></section>
    <section class="carbon dark">
        <div class="content">
        </div>
    </section>
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
