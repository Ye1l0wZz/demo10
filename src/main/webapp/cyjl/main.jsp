<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<html>
<head>
    <title>成语接龙</title>
</head>
<body>
<h1>欢迎来到成语接龙</h1>
<h2>当前的成语进度为:</h2>

<%
    String s= (String) session.getAttribute("msg");
    if(s!=null){
        out.println(s);
    }
    else {
        out.println("暂时没有成语，请进行输入");
    }
%>
<br>
<form action="information.jsp" method="post">
    输入成语:<input type="text" name="idioms">
    <input type="submit" value="提交">
</form>
</body>
</html>
