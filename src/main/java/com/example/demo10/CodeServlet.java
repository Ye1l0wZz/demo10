//生成二维码

package com.example.demo10;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CodeServlet")
public class CodeServlet extends HttpServlet {

    //定义验证码的源码
    private static final String str = "abcdefghijklmnopqrstuvwxyaABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

    //定义随机数
    private Random random = new Random();

    //随机生成四个字符
    public String getStr() {
        String s = "";
        int len = str.length();
        for (int i = 0; i < 4; i++) {
            s += str.charAt(random.nextInt(len));
        }
        return s;
    }

    //随机颜色
    public Color getColor() {

        int red = random.nextInt(256);
        int green = random.nextInt(256);
        int blue = random.nextInt(256);
        Color color = new Color(red, green, blue);

        return color;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub


        //生成验证码图片

        //画板
        BufferedImage image = new BufferedImage(70, 20, BufferedImage.TYPE_INT_RGB);
        //画笔
        Graphics pen = image.getGraphics();
        //矩形
        pen.fillRect(0, 0, 70, 20);
        //字体
        pen.setFont(new Font("微软雅黑", Font.BOLD, 20));

        //获取4个字符
        String code = getStr();

        //绘制图片
        for (int i = 0; i < code.length(); i++) {
            pen.setColor(getColor());
            pen.drawString(String.valueOf(code.charAt(i)), i * 15 + 5, 20);
            ;
        }

        //response对象绘制图片到页面,Servlet输出流进行图片的输出
        ServletOutputStream sos = resp.getOutputStream();
        ImageIO.write(image, "png", sos);

        sos.flush();
        sos.close();

        //验证码放入session
        HttpSession session = req.getSession();
        session.setAttribute("sCode", code);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(req, resp);
    }
}
