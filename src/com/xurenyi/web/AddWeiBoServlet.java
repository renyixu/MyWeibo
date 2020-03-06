package com.xurenyi.web;

import com.xurenyi.pojo.MyWeibo;
import com.xurenyi.pojo.WImg;
import com.xurenyi.service.AddImgsService;
import com.xurenyi.service.AddWeiBoService;
import com.xurenyi.service.FindAllWeiboService;
import com.xurenyi.utils.CopyUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 22:45
 */
@WebServlet(name = "ReceiveWeiBoContentServlet", urlPatterns = "/addWeibo")
public class AddWeiBoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String weiboContent = request.getParameter("weiboContent");

//        AddWeiBoService addWeiBoService = new AddWeiBoService();
//        int insert_wid = addWeiBoService.addWeibo(weiboContent);

        List<WImg> imgs = null;

        //上传图片
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
        List<FileItem> list = null;
        try {
            list = servletFileUpload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        if (list != null)
            for (FileItem fileItem : list) {
                if (fileItem.isFormField()) {
                    //普通表单
                } else {
                    //图片文件
//                    InputStream in = fileItem.getInputStream();
//                    String path = this.getServletContext().getRealPath("img/user_wb_img");
//                    String[] fileNames = fileItem.getName().split("\\.");
//                    String filePath = UUID.randomUUID() + "." + fileNames[1];
//                    FileOutputStream out = new FileOutputStream(path + "/" + filePath);
//                    CopyUtils.uploadFile(in, out); //上传到服务器
//                    in.close();
//                    out.close();
//                    WImg wImg = new WImg();
//                    wImg.setWid(null);
//                    wImg.setWimgid(insert_wid);
//                    wImg.setWimgpath("img/user_wb_img" + "/" + filePath);
//                    imgs.add(wImg);
                    System.out.println("已上传图片：" + fileItem.getName());
                }
            }

//        AddImgsService addImgsService = new AddImgsService();
//        addImgsService.addImgs(imgs);

        //重定向
        response.sendRedirect(this.getServletContext().getContextPath() + "/findAllWeibo");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
