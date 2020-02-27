package com.chenjiahao.rouge.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession();
//        session.setAttribute("isLogin", "ture");
//        session.setAttribute("aid", "niubihh");
        if ("ture".equals(session.getAttribute("isLogin"))) {//登录后，进入session查看session中的登录状态找到判断依据，
            filterChain.doFilter(request, response);
            return;
        }
        response.sendRedirect("/leadingend/login");
    }

    @Override
    public void destroy() {

    }
}
