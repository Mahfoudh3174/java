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
 * Servlet Filter for Role-Based Access Control.
 */
@WebFilter(urlPatterns = {"/Admin/*", "/Home/*","/Bib/*"}) // Filters requests to /Admin and /Home
public class RoleFilter extends HttpFilter implements Filter {

    private static final long serialVersionUID = 1L;

    public RoleFilter() {
        super();
    }

    @Override
    public void destroy() {
        // No specific cleanup required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); // Get existing session, do not create a new one

        String requestURI = req.getRequestURI();
        

        // Check if session exists and user role is defined
        if (session == null || session.getAttribute("role") == null) {
            System.out.println("[RoleFilter] Access denied: No session or role found.");
            res.sendRedirect(req.getContextPath() + "/Login"); // Redirect to login page
            return;
        }

        String role = (String) session.getAttribute("role");

        // Restrict access based on role and URL path
        if (requestURI.startsWith(req.getContextPath() + "/Admin")) {
            if (!"admin".equals(role)) {
                
                res.sendRedirect(req.getContextPath() + "/Error"); // Redirect to error page
                return;
            }
        } else if (requestURI.startsWith(req.getContextPath() + "/Home")) {
            if (!"user".equalsIgnoreCase(role)) {
                
                res.sendRedirect(req.getContextPath() + "/Error");
                return;
            }
        }else if (requestURI.startsWith(req.getContextPath() + "/Bib")) {
            if (!"bibliothecaire".equalsIgnoreCase(role) && !"admin".equalsIgnoreCase(role)) {
                
                res.sendRedirect(req.getContextPath() + "/Error");
                return;
            }
        }

        
        chain.doFilter(request, response); // Continue with request
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        
    }
}
