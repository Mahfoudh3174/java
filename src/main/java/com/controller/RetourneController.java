package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.Gestion;

/**
 * Servlet implementation class RetourneController
 */
@WebServlet("/Home/Retourne")
public class RetourneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetourneController() {
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
			String idEmp=request.getParameter("idEmp");
			if(idEmp==null || !Gestion.isEmprunt(idEmp)) {
				throw new IllegalArgumentException("Invalid Parameter");
			}
			Gestion.retour(idEmp);
			session.setAttribute("success", "Retouner avec Success");
			request.getRequestDispatcher("/WEB-INF/user_history.jsp").forward(request, response);
		}catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			request.getRequestDispatcher("/WEB-INF/user_history.jsp").forward(request, response);
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
