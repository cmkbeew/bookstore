package org.fullstack4.bookstore.filter;

import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebFilter(urlPatterns = {"/admin"})
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        log.info("admin check");

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        if(session.getAttribute("member_id") == null) {
            resp.sendRedirect("/login/login");
            return;
        }

        if(session.getAttribute("member_id") != "admin") {
            resp.sendRedirect("/");
            return;
        }
        chain.doFilter(req, resp);
    }
}
