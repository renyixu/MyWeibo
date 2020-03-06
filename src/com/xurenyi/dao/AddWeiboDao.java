package com.xurenyi.dao;

import com.xurenyi.pojo.MyWeibo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 23:27
 */
public class AddWeiboDao {
    public int addWeibo(MyWeibo myWeibo) throws IOException {
        InputStream in = Resources.getResourceAsStream("config/SqlMapConfig.xml");
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory=sqlSessionFactoryBuilder.build(in);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        sqlSession.insert("addWeibo", myWeibo);
        sqlSession.commit();
        sqlSession.close();
        return myWeibo.getWid(); //返回刚添加的数据id
    }
}
