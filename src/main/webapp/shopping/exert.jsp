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

    <title>My JSP 'pay.jsp' starting page</title>

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
<h2>购物——结账页面</h2>
<jsp:useBean id="buy" class="javabean.Buy" scope="session" />
<jsp:setProperty name="buy" property="*" />

<%
    String Clothes;
    Clothes=request.getParameter("Clothes");
    int C = Integer.parseInt(Clothes);
    buy.setClothes(C);//衣服数量
    Clothes=request.getParameter("Pants");
    int P = Integer.parseInt(Clothes);
    buy.setPants(P);//裤子数量
    Clothes=request.getParameter("Shoes");
    int S = Integer.parseInt(Clothes);
    buy.setShoes(S);//鞋数量
%>

要购买的商品是：<%=buy.Cart()%><br>
当前总金额：<%=buy.Sum()%><br>
<a href="shopping/car.jsp">继续购物</a>

</body>
</html>
