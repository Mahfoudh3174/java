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
 * Servlet implementation class EditPassword
 */
@WebServlet("/EditPassword")
public class EditPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/admin/password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String id =(String) session.getAttribute("id");
		try {
			String oldpass=request.getParameter("oldpassword");
			if(oldpass==null || oldpass.trim().isEmpty() ) {
				throw new IllegalArgumentException("Mot de passe ne peut pas etre vide");
			}
			String newpass=request.getParameter("newpassword");
			if(newpass==null || newpass.trim().isEmpty() ) {
				throw new IllegalArgumentException("Mot de passe ne peut pas etre vide");
			}
			if(newpass.equals(oldpass) ) {
				throw new IllegalArgumentException("les Mot de passe ne peuvent pas etre identiques");
			}
			if(UserDB.findPassword(id).equals(oldpass) ) {
				throw new IllegalArgumentException("Mot de passe ne peut pas etre vide");
			}
			session.setAttribute("success", "Mot de passe Editer avec success");
			request.getRequestDispatcher("/WEB-INF/admin/dashboard.jsp").forward(request, response);
		}catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("success", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/admin/password.jsp").forward(request, response);
		}
	}

}
