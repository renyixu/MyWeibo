package com.xurenyi.test;

import org.junit.Test;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/26 0026 0:09
 */
public class TestDemo {

    @Test
    public void test01(){
        Date date=new Date();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(simpleDateFormat.format(date));
    }
}
