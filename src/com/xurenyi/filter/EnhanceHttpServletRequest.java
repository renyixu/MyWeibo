package com.xurenyi.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.UnsupportedEncodingException;

public class EnhanceHttpServletRequest
        extends HttpServletRequestWrapper {
    private HttpServletRequest request;
    //把被增强的类作为参数传入增强类的构造方法中
    public EnhanceHttpServletRequest(HttpServletRequest request){
        super(request);
        this.request=request;
    }

    //重写增强方法
    @Override
    public String getParameter(String name){
        try {
            return new String(request.getParameter(name).
                    getBytes("iso8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }
}
