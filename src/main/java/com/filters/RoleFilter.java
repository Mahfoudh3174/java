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
 * Servlet Filter implementation class RoleFilter
 */
@WebFilter("/Admin/*")
public class RoleFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public RoleFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("Hi from Role filter");

		 HttpServletRequest req = (HttpServletRequest) request;
	        HttpServletResponse res = (HttpServletResponse) response;
	        HttpSession session = req.getSession(false);
	        System.out.println("RoleFilter checking access for: " + req.getRequestURI());

	        if (session == null || session.getAttribute("role") == null) {
	        	System.out.println("Access denied: No session found.");
	            res.sendRedirect(req.getContextPath() + "/Login");
	            return;
	        }

	        String role = (String) session.getAttribute("role");

	        if ("admin".equalsIgnoreCase(role)) {
	            // Proceed if the user is an admin
	            chain.doFilter(request, response);
	        } else {
	            // Redirect non-admin users to an error page
	        	System.out.println("Access denied: User does not have admin privileges.");
	            res.sendRedirect(req.getContextPath() + "/Error");
	        }
	    }

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
