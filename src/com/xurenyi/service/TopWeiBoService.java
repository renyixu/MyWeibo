package com.xurenyi.service;

import com.xurenyi.dao.TopWeiBoDao;

import java.io.IOException;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 12:09
 */
public class TopWeiBoService {
    public int topWeiBo(Integer top_wid) {
        TopWeiBoDao topWeiBoDao=new TopWeiBoDao();
        try {
            return topWeiBoDao.topWeiBo(top_wid);
        } catch (IOException e) {
            return 0;
        }
    }
}
