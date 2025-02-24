package com.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("/*") // Applies to all requests
public class AuthFilter extends HttpFilter implements Filter {

    public AuthFilter() {
        super();
    }

    public void destroy() {
        // Cleanup if necessary
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getRequestURI();
        boolean isPublicPath = path.endsWith("Login") || path.endsWith("Register") || path.contains("Home") || path.startsWith("Logout");

        

        if (isPublicPath || (session != null && session.getAttribute("role") != null)) {
            // Proceed with the request if user is authenticated or accessing a public page
            chain.doFilter(request, response);
        } else {
            // Redirect to login page if user is not authenticated
        	
            res.sendRedirect(req.getContextPath() + "/Login");
        }
    
    }

    public void init(FilterConfig fConfig) throws ServletException {
        // Initialization if necessary
    }
}
