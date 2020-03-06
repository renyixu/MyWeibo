package com.xurenyi.service;

import com.xurenyi.dao.AddImgsDao;
import com.xurenyi.pojo.WImg;

import java.io.IOException;
import java.util.List;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 20:18
 */
public class AddImgsService {
    public void addImgs(List<WImg> imgs) {
        AddImgsDao addImgsDao=new AddImgsDao();
        try {
            addImgsDao.addImgs(imgs);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
