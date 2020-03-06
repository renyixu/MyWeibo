package com.xurenyi.service;

import com.xurenyi.dao.DeleteWeiBoDao;

import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 11:18
 */
public class DeleteWeiBoService {
    public int deleteWeiBo(Integer delete_wid) {
        DeleteWeiBoDao deleteWeiBoDao=new DeleteWeiBoDao();
        try {
            return deleteWeiBoDao.deleteWeiBo(delete_wid);
        } catch (IOException e) {
            return 0;
        }
    }
}
