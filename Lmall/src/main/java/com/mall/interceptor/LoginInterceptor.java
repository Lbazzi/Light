package com.mall.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        //登录页面放行
        if (request.getRequestURI().contains("login") //判断url中是否有登陆选项，若包含登录选项，直接放行
                || request.getRequestURI().contains("index")
                || request.getRequestURI().contains("prodectDetail")
                || request.getRequestURI().contains("productList")
                || request.getRequestURI().contains("queryProductByPclass")
                || request.getRequestURI().contains("queryProductByPid")
                || request.getRequestURI().contains("queryProductByPname")
                || request.getRequestURI().contains("queryUserByUphone")
                || request.getRequestURI().contains("checkUpassword")
        ) {
            return true;
        }

        //登录了：放行
        if (session.getAttribute("user") != null) { //判断session中是否有user，有则直接放行
            return true;
        }

        //没有登录
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return false;
    }

}
