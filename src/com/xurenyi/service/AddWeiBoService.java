package com.xurenyi.service;

import com.xurenyi.dao.AddWeiboDao;
import com.xurenyi.pojo.MyWeibo;

import java.io.IOException;
import java.util.Date;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 23:24
 */
public class AddWeiBoService {
    public int addWeibo(String weiboContent) {
        MyWeibo myWeibo=new MyWeibo();
        Date date=new Date();
        myWeibo.setWcontent(weiboContent);
        myWeibo.setWdate(date);
        myWeibo.setIs_edit(0);
        myWeibo.setIs_top(0);
        AddWeiboDao addWeiboDao=new AddWeiboDao();
        try {
            return addWeiboDao.addWeibo(myWeibo);
        } catch (IOException e) {
            return 0;
        }
    }
}
