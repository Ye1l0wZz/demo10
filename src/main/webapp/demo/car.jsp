<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/28
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
//    取得上一个页面中的各book值 存放在对应名称的变量中
    String book1 = request.getParameter("book1");
    String book2 = request.getParameter("book2");
    String book3 = request.getParameter("book3");
    String book4 = request.getParameter("book4");
    String book5 = request.getParameter("book5");

//    将对应名称的变量值赋予当前页面的 book键
//    注意：上下两行的“book1”等 虽然名字一样但其实是两个页面的book
//    eg demobook1
    session.setAttribute("demobook1", book1);
    session.setAttribute("book2", book2);
    session.setAttribute("book3", book3);
    session.setAttribute("book4", book4);
    session.setAttribute("book5", book5);
%>
<h1>您的购物车中有：</h1>
<%--上下键名相等才能输出 【--%>
<p> java：${sessionScope.demobook1}</p>
<p> javaweb：${sessionScope.book2}</p>
<p> C++：${sessionScope.book3}</p>
<p> python：${sessionScope.book4}</p>
<p> C：${sessionScope.book5}</p>
<a href="shopping.jsp">返回</a>

</body>
</html>
