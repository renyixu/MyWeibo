package com.xurenyi.web;

import com.xurenyi.service.DeleteWeiBoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 11:15
 */
@WebServlet(name = "DeleteWeiBoServlet", urlPatterns = "/deleteWeibo")
public class DeleteWeiBoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //获取要删除的wid
        Integer delete_wid=Integer.parseInt(request.getParameter("delete_wid"));
        DeleteWeiBoService deleteWeiBoService=new DeleteWeiBoService();
        int deleteCount=deleteWeiBoService.deleteWeiBo(delete_wid);
        //重定向
        response.sendRedirect(this.getServletContext().getContextPath()+"/findAllWeibo");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
