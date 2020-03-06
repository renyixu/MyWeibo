package com.xurenyi.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

@WebFilter(filterName="myFilter",urlPatterns={"/*"})
public class MyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig){
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        System.out.println("MyFilter is running......");
        //放行
        /*
            FilterChain(过滤器链)知道每一个Filter对象的顺序，如果当前Filter对象放行，
            那么FilterChain会去寻找下一个Filter对象
         */
        //设置编码方式
        //方式一：使用装饰者模式来进行方法的增强
//        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //EnhanceHttpServletRequest enhanceHttpServletRequest=new EnhanceHttpServletRequest((HttpServletRequest) request);
        //chain.doFilter(enhanceHttpServletRequest,response);

        //方式二：使用动态代理来进行全局编码的设置
        final HttpServletRequest httpServletRequest= (HttpServletRequest) request;
        final HttpServletRequest req= (HttpServletRequest) Proxy.newProxyInstance(
                httpServletRequest.getClass().getClassLoader(),
                //获取该类所继承的所有接口，以数组形式返回
                httpServletRequest.getClass().getInterfaces(),
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy,
                                         Method method,
                                         Object[] args) throws Throwable {
                        //判断方法，如果是getParameter方法就设置编码方式
                        if("getParameter".equals(method.getName()))
                        return new String(method.invoke(httpServletRequest,args).
                                toString().getBytes("iso8859-1"),"UTF-8");
                        return method.invoke(httpServletRequest,args);
                    }
                }
        );
        //放行
        /*把创建的代理对象req传入到doFilter方法中，
          那么在servlet调用getParameter方法的就是代理对象了
         */
        chain.doFilter(req,response);

    }

    @Override
    public void destroy(){
        System.out.println("filter destroy......");
    }
}
