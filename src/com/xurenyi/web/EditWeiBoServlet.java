package com.xurenyi.web;

import com.xurenyi.service.EditWeiboService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 13:44
 */
@WebServlet(name = "EditWeiBoServlet", urlPatterns = "/editWeibo")
public class EditWeiBoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Integer isEdit=Integer.parseInt(request.getParameter("isEdit"));
        Integer edit_wid=null;
        String edit_wcontent=null;
        //是简单的页面跳转
        if(isEdit==0){
            edit_wid=Integer.parseInt(request.getParameter("edit_wid"));
            edit_wcontent=request.getParameter("edit_wcontent");
            request.setAttribute("edit_wid",edit_wid);
            request.setAttribute("edit_wcontent",edit_wcontent);
            //转发到edit.jsp页面
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/edit.jsp");
            requestDispatcher.forward(request,response);
        }else if(isEdit==1){
            edit_wid=Integer.parseInt(request.getParameter("editWeiboId"));
            edit_wcontent=request.getParameter("editWeiboContent");
            EditWeiboService editWeiboService = new EditWeiboService();
            int editWeiboCount=editWeiboService.editWeibo(edit_wid,edit_wcontent);
            //重定向
            response.sendRedirect(this.getServletContext().getContextPath()+"/findAllWeibo");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
