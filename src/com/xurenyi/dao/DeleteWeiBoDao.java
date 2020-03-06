package com.xurenyi.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 11:19
 */
public class DeleteWeiBoDao {
    public int deleteWeiBo(Integer delete_wid) throws IOException {
        InputStream in = Resources.getResourceAsStream("config/SqlMapConfig.xml");
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory=sqlSessionFactoryBuilder.build(in);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        int deleteCount = sqlSession.delete("deleteWeiboById", delete_wid);
        sqlSession.commit();
        sqlSession.close();
        return deleteCount;
    }
}
