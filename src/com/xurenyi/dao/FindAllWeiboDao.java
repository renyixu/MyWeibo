package com.xurenyi.dao;

import com.xurenyi.pojo.MyWeibo;
import com.xurenyi.pojo.WImg;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 23:32
 */
public class FindAllWeiboDao {
    public List<MyWeibo> findAllWeibo() throws IOException {
        InputStream in = Resources.getResourceAsStream("config/SqlMapConfig.xml");
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory=sqlSessionFactoryBuilder.build(in);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        List<MyWeibo> weiboList = sqlSession.selectList("findAllWeibo");
        return weiboList;
    }

    public List<WImg> findImgsByWid(Integer wid) throws IOException {
        InputStream in = Resources.getResourceAsStream("config/SqlMapConfig.xml");
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory=sqlSessionFactoryBuilder.build(in);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        List<WImg> imgs = sqlSession.selectList("findImgsBywid", wid);
        return imgs;
    }
}
