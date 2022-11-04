import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/LoginCI")
public class LoginCI extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

//   获取一个会话
        HttpSession session = request.getSession();

//        获取用户输入验证码
        String checkCode = request.getParameter("checkCode");
//    获取session中的验证码,也就是CodeServlet中生成的四个字符
        String sessionCode = (String) session.getAttribute("sCode");


//      获取请求数据 uname（文本框） passwd(密码框）并分别赋给两个简洁变量。

        String uname = request.getParameter("uname");
        String passwd = request.getParameter("passwd");
        String twoDays = request.getParameter("isFlag");
        PrintWriter out = response.getWriter();
//        对两个简洁变量（即文本框）进行操作


//        连接数据库

//        连接驱动

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/test"; //数据库名
        String username = "root";  //数据库用户名
        String password = "1";  //数据库用户密码

        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            //创建发射器
            Statement stmt = conn.createStatement();
            //创建sql语句
            String sql = "select*from test.user where uname='"+uname+"' and passwd='"+passwd+"'";
            //发送sql语句并接收结果
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()&& checkCode.equals(sessionCode)) {
                out.print("登陆成功");
                if ("ok".equals(twoDays)) {
                //将用户信息存储到cookie中，并且关联路径和设置有效时间
                Cookie cookie1 = new Cookie("uname", uname);
                Cookie cookie2 = new Cookie("passwd", passwd);
                cookie1.setPath("/");
                cookie2.setPath("/");
                cookie1.setMaxAge(10);//10秒
                cookie2.setMaxAge(10);
                //服务器发送cookie给客户端浏览器
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }
//            跳转到主页
            response.sendRedirect("/demo10/index.jsp");

            } else {
                out.print("登陆失败");
                request.setAttribute("error_code", "验证码不匹配");
                response.sendRedirect("/demo10/login.jsp");

            }
            rs.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }






//        //  查看用户名和密码是否正确,并用cookie记录
//        if (uname.equals("1") && passwd.equals("1") && checkCode.equals(sessionCode)) {
//            if ("ok".equals(twoDays)) {
//                //将用户信息存储到cookie中，并且关联路径和设置有效时间
//                Cookie cookie1 = new Cookie("uname", uname);
//                Cookie cookie2 = new Cookie("passwd", passwd);
//                cookie1.setPath("/");
//                cookie2.setPath("/");
//                cookie1.setMaxAge(10);//10秒
//                cookie2.setMaxAge(10);
//                //服务器发送cookie给客户端浏览器
//                response.addCookie(cookie1);
//                response.addCookie(cookie2);
//            }
////            跳转到主页
//            response.sendRedirect("/demo10/index.jsp");
//        } else {
////            跳转到登陆失败页面
//            request.setAttribute("error_code", "验证码不匹配");
//            response.sendRedirect("/demo10/login.jsp");
//
//        }
//


        //    得到session会话
        HttpSession hs = request.getSession(true);
        // 修改session存在时间为20s
        hs.setMaxInactiveInterval(10);
        //添加键名RIGHT 值为YES
        hs.setAttribute("Right", "yes");


        //验证验证码是否正确
////   获取一个会话
//        HttpSession session = request.getSession();
//
////        获取用户输入验证码
//        String checkCode = request.getParameter("checkCode");
////    获取session中的验证码,也就是CodeServlet中生成的四个字符
//        String sessionCode = (String) session.getAttribute("sCode");

////验证码正确
//        if(checkCode.equals(sessionCode)) {
//            response.sendRedirect("index.jsp");
//        }
//        else {
//                //验证码不正确
//                request.setAttribute("error_code", "验证码不匹配");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            }


    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

}