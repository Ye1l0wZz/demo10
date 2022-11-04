<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/9/20
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<h1>登录界面</h1>
<form action=/demo10/LoginCI method=post>
    <%--   提交文本框和密码框给action，并分别命名--%>
    用户名:<input type=text name=uname><br>
    密码：<input type=password name=passwd><br>
    验证码: <input type="text" name="checkCode" height="20px " value=""><br>
    <img src="CodeServlet"/><span>${error_code}</span><br/>

    <td colspan="2" align="center"><input name="isFlag" type="checkbox" value="ok">两天内免登陆</td>
    <input type="button" value="注册" style="margin-left: 55px;margin-top: 5px" onclick="Register()">

    <input type=submit value=登录><br>
</form>

<script type="text/javascript">
    /**
     * 实现注册页面的跳转
     */
    function Register() {
        window.location = "register.jsp";
    }
</script>


<%
    //获取cookie
    Cookie[] cookies = request.getCookies();
    //取出cookie中的值
    String username = "";
    String password = "";
    if (cookies != null && cookies.length > 0) {
        for (Cookie cookie : cookies) {
            String cookieName = cookie.getName();
            if ("uname".equalsIgnoreCase(cookieName)) {
                username = cookie.getValue();
            }
            if ("passwd".equalsIgnoreCase(cookieName)) {
                password = cookie.getValue();
            }
            if ("uname".equalsIgnoreCase(cookieName)) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }
%>


</body>
</html>
