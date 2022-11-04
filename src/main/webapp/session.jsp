<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/9/23
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>session计数</title>
</head>
<body>
<%
    int number = 0;
    Object obj = session.getAttribute("number");
    if (obj == null) {
        number++;
        session.setAttribute("number", String.valueOf((number)));
    } else {
        number = Integer.parseInt(obj.toString());
        number++;
        session.setAttribute("number", String.valueOf((number)));
        //session.setAttribute（“key”,value）类似于设置键值对(session对象）
    }
%>
<br>
<div align="left">
    <table>
        <tr>
            <th>第<%=number%>次访问本站</th>
        </tr>
    </table>


</div>


</body>
</html>
