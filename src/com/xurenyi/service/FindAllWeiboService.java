package com.xurenyi.service;

import com.xurenyi.dao.FindAllWeiboDao;
import com.xurenyi.pojo.MyWeibo;
import com.xurenyi.pojo.WImg;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 23:32
 */
public class FindAllWeiboService {
    public List<MyWeibo> findAllWeibo() {
        try {
            FindAllWeiboDao findAllWeiboDao = new FindAllWeiboDao();
            List<MyWeibo> weiboList = findAllWeiboDao.findAllWeibo();
            //时间转换
            SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for(MyWeibo wb:weiboList){
                wb.setWdateStr(df.format(wb.getWdate()));
            }

            //遍历weiboList,根据wid查询图片集合
            for(MyWeibo wb:weiboList){
                try {
                    List<WImg> imgs = findAllWeiboDao.findImgsByWid(wb.getWid());
                    wb.setImgs(imgs);
                }catch(IOException e){
                    wb.setImgs(null);
                }
            }
            return weiboList;
        } catch (IOException e) {
            return null;
        }
    }
}
