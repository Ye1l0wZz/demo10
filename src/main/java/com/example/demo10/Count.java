
//共享变量


package com.example.demo10;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.Math.pow;

@WebServlet("/Count")
public class Count extends HttpServlet {
    //设置可累计数
    int count;
    double p;

    public void init(ServletConfig config) throws ServletException {
        //初始化
        super.init(config);
        count = 0;
        p = 0;
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得一个向客户发送数据的输出流
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        //设置相应的mime类型
        out.println("<HTML><BODY>");
        count++;
        double s, a;
        int c;
        c = count + 1;
        a = 1.0 / (2 * count - 1);

        s = 4 * a * pow(-1, c);
        p = p + s;

        out.println("you are " + count + "th people");
        out.println("<body></html>");
        out.println("PI=" + p);

    }
}
