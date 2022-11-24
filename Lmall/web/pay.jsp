<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付界面</title>
</head>
<body>
<h1>支付界面</h1>
<form action="${pageContext.request.contextPath}/updateOrderByOstatus?ostatus=1&oid=${oid}" method="post">
    <%--点击支付成功，修改订单状态--%>
    <input type="submit" value="支付成功">
</form>
</body>
</html>
