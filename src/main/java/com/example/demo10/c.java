//cookie计数

package com.example.demo10;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import static java.lang.System.out;

@WebServlet("/Cookie")
public class c extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置浏览器以UTF-8编码进行输出
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //获取所有cookie
        Cookie[] cookies = request.getCookies();

        if (cookies == null)
            out.write("这是您第一次访问本站！");
        else {
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

    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }


}
