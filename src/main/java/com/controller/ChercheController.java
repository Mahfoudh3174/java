package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

import com.data.BookDB;
import com.model.Book;

/**
 * Servlet implementation class ChercheController
 */
@WebServlet("/Home/Cherche")
public class ChercheController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChercheController() {
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
			String valeur=request.getParameter("valeur");
			if(valeur==null || valeur.trim().isEmpty()) {
				throw new IllegalArgumentException("Invalid");
			}
			if(BookDB.search(valeur).isEmpty()) {
				throw new IllegalArgumentException("le livre n'existe pas");
			}
			Map<String,Book> resultat=BookDB.search(valeur);
			request.setAttribute("resultat", resultat);
			request.getRequestDispatcher("/WEB-INF/cherche.jsp").forward(request, response);
		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			response.sendRedirect(request.getContextPath()+"/Home");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
