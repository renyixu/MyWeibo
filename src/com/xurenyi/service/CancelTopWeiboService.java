package com.xurenyi.service;

import com.xurenyi.dao.CancelTopWeiboDao;

import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 12:23
 */
public class CancelTopWeiboService {
    public int cancelTopWeibo(Integer ctop_wid) {
        CancelTopWeiboDao cancelTopWeiboDao=new CancelTopWeiboDao();
        try {
            return cancelTopWeiboDao.cancelTopWeibo(ctop_wid);
        } catch (IOException e) {
            return 0;
        }
    }
}
