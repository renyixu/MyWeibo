package com.xurenyi.web;

import com.xurenyi.service.CancelTopWeiboService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 12:21
 */
@WebServlet(name = "CancelTopWeiboServlet", urlPatterns = "/cancelTopWeibo")
public class CancelTopWeiboServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Integer ctop_wid=Integer.parseInt(request.getParameter("ctop_wid"));
        CancelTopWeiboService cancelTopWeiboService=new CancelTopWeiboService();
        int cancelTopWeiboCount=cancelTopWeiboService.cancelTopWeibo(ctop_wid);
        //重定向
        response.sendRedirect(this.getServletContext().getContextPath()+"/findAllWeibo");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
