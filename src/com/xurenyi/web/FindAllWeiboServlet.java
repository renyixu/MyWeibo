package com.xurenyi.web;

import com.xurenyi.pojo.MyWeibo;
import com.xurenyi.service.FindAllWeiboService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 23:40
 */
@WebServlet(name = "FindAllWeiboServlet", urlPatterns = "/findAllWeibo")
public class FindAllWeiboServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //查询所有微博并转发
        List<MyWeibo> weiboList=new FindAllWeiboService().findAllWeibo();
        request.setAttribute("weiboList",weiboList);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
