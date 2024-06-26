package org.fullstack4.bookstore.filter;

import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Log4j2
@WebFilter(urlPatterns = {"/my/*", "/community/view/*", "/data/*", "/admin/*", "/member/modify/*", "/member/modifyPwd/*", "/member/view/*"
,"/product/view/review" ,"/my/cart/*", "/product/review/regist/*"})
public class Loginfilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        log.info("Login check");
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        if(session.getAttribute("member_id") == null) {
            resp.sendRedirect("/login/login");
            return;
        }
        chain.doFilter(req,resp);

    }
}
