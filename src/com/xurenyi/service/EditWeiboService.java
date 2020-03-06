package com.xurenyi.service;

import com.xurenyi.dao.EditWeiboDao;
import com.xurenyi.pojo.MyWeibo;

import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 14:00
 */
public class EditWeiboService {
    public int editWeibo(Integer edit_wid, String edit_wcontent) {
        try {
            EditWeiboDao editWeiboDao=new EditWeiboDao();
            MyWeibo myWeibo=new MyWeibo();
            myWeibo.setWid(edit_wid);
            myWeibo.setWcontent(edit_wcontent);
            myWeibo.setIs_edit(1);
            return editWeiboDao.editWeibo(myWeibo);
        } catch (IOException e) {
            return 0;
        }
    }
}
