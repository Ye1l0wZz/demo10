<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/11
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String uname = request.getParameter("uname");
        String passwd = request.getParameter("passwd");
        String[] hobby = request.getParameterValues("hobby");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test"; //数据库名
            String username = "root";  //数据库用户名
            String password = "1";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

            if(conn != null) {
                out.print("数据库连接成功！");
                out.print("<br />");
                Statement stmt = null;
                ResultSet rs = null;
                //创建发射器
                stmt=conn.createStatement();
                //创建sql语句
                String sql="insert into user(uname,passwd) value ('"+uname+"','"+passwd+"')";
                int count = stmt.executeUpdate(sql);
                if (count>0){
                    out.print("注册成功");

                }
                else{
                    out.print("注册失败");
                }
                stmt.close();
                conn.close();

            }
            else{
                out.print("连接失败！");
            }
        }catch (Exception e) {
            out.print("数据库连接异常！");
        }





        session.setAttribute("uname", uname);
        session.setAttribute("passwd", passwd);
        session.setAttribute("hobby", Arrays.toString(hobby));
        response.sendRedirect("index.jsp");


    %>
    <title>注册成功跳转</title>
</head>
<body>


</body>
</html>
