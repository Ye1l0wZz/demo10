<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/12
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int number = 0;
    if (application.getAttribute("number") == null) {
        number = 1;
    } else {
        number = Integer.parseInt((String) application.getAttribute("number"));
        number = number + 1;
    }
    out.print("您是第" + number + "位访问者！");
    application.setAttribute("number", String.valueOf(number));
%>

</body>
</html>
