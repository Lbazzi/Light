<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
</head>
<body>
<section>
    <div class="container" style="opacity: 0.9">
        <%--登录--%>
        <div class="user signinBx">
            <div class="imgBx"><img src="${pageContext.request.contextPath}/statics/img/3.png"></div>
            <div class="formBx">
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <h2>Sign In</h2>
                    <%--查看用户名是否存在--%>
                    <input type="text" placeholder="Phone" name="uphone" id="uphone" onblur="checkUphone()" required>
                    <input type="password" placeholder="Password" name="upassword" id="upassword" onblur="checkUpassword()" required>

                    <input type="submit" value="Login" id="submit">
                    <span style="padding-left: 30px" id="checkInfo"></span>
                    <p class="signup">
                        Don't have an account?
                        <a href="#" onclick="toggleForm();">Sign up.</a>
                    </p>
                </form>
            </div>
        </div>

        <div class="user signupBx">
            <div class="formBx">
                <%--注册--%>
                <form action="${pageContext.request.contextPath}/signUp" method="post">
                    <h2>Create an account</h2>
                    <input type="text" placeholder="Phone" name="uphone" required>
                    <input type="text" placeholder="Username" name="uname" required>
                    <input type="hidden" name="ugender" value="男">
                    <input type="hidden" name="ustatus" value="1"/>
                    <input type="text" placeholder="Email Address" name="uemail" required>
                    <input type="text" placeholder="Create Password" name="upassword" required>
                    <input type="text" placeholder="收货地址" name="uaddress" required>
                    <input type="submit" value="Sign Up">
                    <p class="signup">Already have an account? <a href="#" onclick="toggleForm();">Sign in.</a></p>
                </form>
            </div>
            <div class="imgBx">
                <img src="${pageContext.request.contextPath}/statics/img/17.png">
            </div>
        </div>
    </div>
</section>
<script>
    function toggleForm(){
        section = document.querySelector('section');
        container = document.querySelector('.container');
        container.classList.toggle('active');
        section.classList.toggle('active');
    }
    //验证用户名是否存在
    function checkUphone() {
        if (document.getElementById('uphone').value !== "") {
            jQuery.post({
                url: "${pageContext.request.contextPath}/queryUserByUphone",
                data: {"uphone" : $("#uphone").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#checkInfo").html(" ");
                        document.getElementById("submit").disabled = false;
                    } else {
                        $("#checkInfo").html(data);
                        document.getElementById("submit").disabled = true;
                    }
                }
            })
        }
    }

    //验证密码是否正确
    function checkUpassword() {
        if (document.getElementById('upassword').value !== "") {
            jQuery.post({
                url: "${pageContext.request.contextPath}/checkUpassword",
                data: {
                    "uphone": $("#uphone").val(), "upassword": $("#upassword").val()
                },
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#checkInfo").html("");
                        document.getElementById("submit").disabled = false;
                    } else {
                        $("#checkInfo").html(data);
                        document.getElementById("submit").disabled = true;
                    }
                }
            })
        }
    }
</script>
</body>
</html>







