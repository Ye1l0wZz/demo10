<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>欢迎登录
</h1>

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
        //session.getAttribute（“key”,value）类似于设置键值对(session对象）
    }
%>

<br>
<div align="left">
    <table>
        <tr>
            <%--记录登陆次数--%>
            <th>欢迎你<%=number%>次访问本站</th>
        </tr>
    </table>
</div>
<br/>

<% Cookie[] cookies = request.getCookies();

    if (cookies == null)
        out.write("这是您第一次访问本站！");
    else {
        //记录上次登录时间
        out.write("您上次的访问时间是：");
        //查找cookie
        for (int i = 0; i < cookies.length; i++) {
            //哪个cookie含有lastTime
            Cookie cookie = cookies[i];
            if (cookie.getName().equals("lastTime")) {
                Long lastTme = Long.parseLong(cookie.getValue());
                Date date = new Date(lastTme);
                out.write(date.toString());
            }
        }
    }
    //用户访问过后重新设置用户访问时间，存储到cookie中并发送到服务器
    Cookie cookie = new Cookie("lastTime", System.currentTimeMillis() + "");
    //设置cookie的有效期为一天
    cookie.setMaxAge(5);
    //将cookie对象添加到response中，这样输出response对象时就会把cookie也输出
    response.addCookie(cookie);
%>

<%
    HttpSession hs = request.getSession(true);
    String val = (String) hs.getAttribute("Right");
    if (val == null) {//异常则返回登录界面，防止非法登录
        response.sendRedirect("/demo10/login.jsp");
    } else {

    }
%>


<p> 用户名：${sessionScope.uname}</p>
<p> 密码：${sessionScope.passwd}</p>
<p> 爱好：${sessionScope.hobby}</p>


<a href="login.jsp">重新登陆</a>
</body>
</html>