package com.gd.diary;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebFilter({"/auth/*"})
public class LoginFilter implements Filter {
  private static final Logger log = LoggerFactory.getLogger(com.gd.diary.LoginFilter.class);
  
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpSession session = null;
    if (request instanceof HttpServletRequest)
      session = ((HttpServletRequest)request).getSession(); 
    if (session.getAttribute("sessionMember") == null) {
      if (response instanceof HttpServletResponse)
        ((HttpServletResponse)response).sendRedirect("/diary/login"); 
      return;
    } 
    chain.doFilter(request, response);
    log.debug("===========loginfilter" + session);
  }
}
