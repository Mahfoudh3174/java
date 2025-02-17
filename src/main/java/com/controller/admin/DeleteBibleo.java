package com.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.UserDB;

/**
 * Servlet implementation class DeleteBibleo
 */
@WebServlet("/Admin/DeleteBibleo")
public class DeleteBibleo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBibleo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		try {
			String id=request.getParameter("id");
			if(id==null || !UserDB.isUser(id)) {
				throw new IllegalArgumentException("Invalid parameter");
			}
			UserDB.deleteUser(id);
			session.setAttribute("success", "Suprimer avec success");
			response.sendRedirect(request.getContextPath()+"/Admin/Bibleo");
	         // request.getRequestDispatcher("/WEB-INF/admin/librairians.jsp").forward(request, response);
		}catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			response.sendRedirect(request.getContextPath()+"/Admin/Bibleo");
	         // request.getRequestDispatcher("/WEB-INF/admin/librairians.jsp").forward(request, response);
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
