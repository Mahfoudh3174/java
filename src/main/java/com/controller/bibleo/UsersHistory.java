package com.controller.bibleo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.UserDB;

/**
 * Servlet implementation class UsersHistory
 */
@WebServlet("/Bib/UsersHistory")
public class UsersHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		try {
			String iduser=request.getParameter("id");
			if(iduser==null || !UserDB.isUser(iduser)) {
				throw new IllegalArgumentException("Invalid parametre");
			}
			request.setAttribute("iduser", iduser);
			request.getRequestDispatcher("/WEB-INF/bib/usersHistory.jsp").forward(request, response);
		}
		catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			response.sendRedirect(request.getContextPath()+"/Bib/Gestion");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
