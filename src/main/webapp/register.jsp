<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/9
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <h1>用户注册</h1>
    <%--  将表单信息提交到RegisterServlet中 --%>
    <form action=${pageContext.request.contextPath}/RegisterServlet.jsp method="post">

        <%--        相对路径的写法=/demo10--%>
        <table>
            <tr>
                <td>用户名：</td>
                <td><input type="text" name="uname" placeholder="请输入用户名" autocomplete="off"></td>
                <%--  autocomplete="off"   防止浏览器自动填充内容    --%>
            </tr>

            <tr>
                <td valign="top">密&nbsp;&nbsp;&nbsp;码：</td>
                <td><input type="password" name="passwd" placeholder="请输入密码"></td>
            </tr>

            <tr>
                <td valign="top">爱&nbsp;&nbsp;&nbsp;好：</td>
                <td>
                    <input type="checkbox" name="hobby" value="电子竞技">电子竞技
                    <input type="checkbox" name="hobby" value="美食鉴赏">美食鉴赏
                    <br>
                    <input type="checkbox" name="hobby" value="思考人生">思考人生
                    <input type="checkbox" name="hobby" value="养精蓄锐">养精蓄锐
                </td>
            </tr>

            <tr align="center">
                <td colspan="2">
                    <input type="submit" value="注册"/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重填"/>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>
