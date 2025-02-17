package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.BookDB;
import com.data.Gestion;
import com.data.UserDB;
import com.model.Emprunt;

/**
 * Servlet implementation class Emprunter
 */
@WebServlet("/Home/Emprunter")
public class Emprunter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Emprunter() {
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
			String isbn=request.getParameter("isbn");
			if(isbn==null || !BookDB.isBook(isbn)) {
				throw new IllegalArgumentException("Invalid Parameter");
			}
			String id=(String ) session.getAttribute("id");
			Emprunt em=new Emprunt();
			em.setISBN(isbn);
			em.setNumero(id);
			boolean e=Gestion.addEmprunter(em);
			if(!e) {
				throw new IllegalArgumentException("Vous-avez ce Livre dejas");
			}
			session.setAttribute("success", "Emprunter avec Success");
			response.sendRedirect(request.getContextPath()+"/Home");
		}
		catch (IllegalArgumentException e) {
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
		doGet(request, response);
	}

}
