package com.xurenyi.dao;

import com.xurenyi.inter.AddImgsMapper;
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
 * @date 2020/2/27 0027 20:28
 */
public class AddImgsDao {
    public void addImgs(List<WImg> imgs) throws IOException {
        InputStream in = Resources.getResourceAsStream("config/SqlMapConfig.xml");
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBuilder.build(in);
        SqlSession sqlSession=sqlSessionFactory.openSession();
        AddImgsMapper addImgsMapper = sqlSession.getMapper(AddImgsMapper.class);
        addImgsMapper.addImgs(imgs);
        sqlSession.commit();
        sqlSession.close();
    }
}
