<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javabean.Buy"  %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'buy.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<h2>购物——商品选择页面</h2>
<jsp:useBean id="buy" class="javabean.Buy" scope="session" />
<jsp:setProperty name="buy" property="*" />

欢迎来到百货商店！<br>
请选择要购买的商品：<br>
<form action="shopping/exert.jsp" method="post">
    <%--使用三个文本框代替checkbox --%>
    <input type="number" name="Clothes" style="width:40px" value="0">衣服 120元
    <input type="number" name="Pants" value="0" style="width:40px;">裤子 100元
    <input type="number" name="Shoes" style="width:40px;"value="0">鞋 80元<br>
    <input type="submit" value="提交"/>
    <br/>
</form>
</body>
</html>


