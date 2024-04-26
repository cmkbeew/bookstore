package org.fullstack4.bookstore.filter;

import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebFilter(urlPatterns = "/*")
public class AutoLoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        Cookie[] cookies =req.getCookies();
        if (cookies != null) {
            String auto_login = "";
            String id = "";
            for(Cookie c : cookies) {
                if(c.getName().equals("auto_login")) {
                    auto_login = c.getValue();
                } if(c.getName().equals("id")) {
                    id = c.getValue();
                }
            }
            if (auto_login.equals("on")) {
                session.setAttribute("member_id",id);
            }
            chain.doFilter(req,resp);
        }
    }
}
