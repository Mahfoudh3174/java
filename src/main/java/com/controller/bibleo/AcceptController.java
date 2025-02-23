package com.controller.bibleo;

import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.data.Gestion;
import com.model.Emprunt;

/**
 * Servlet implementation class AcceptController
 */
@WebServlet("/Bib/Accept")
public class AcceptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptController() {
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
				throw new IllegalArgumentException("Invalid id");
			}
			
			session.setAttribute("idEmp", idEmp);
			
			request.getRequestDispatcher("/WEB-INF/bib/accepter.jsp").forward(request, response);
			
		}catch (IllegalArgumentException e) {
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
		HttpSession session=request.getSession();
		try {
			String idEmp=(String) session.getAttribute("idEmp");
			
			String date=request.getParameter("date");
			if(date==null || date.trim().isEmpty()) {
				throw new IllegalArgumentException("date ne peut pas etre vide");
			}
			if(!date.matches("\\d{4}-\\d{2}-\\d{2}")) {
				throw new IllegalArgumentException("format de date est in correct");
			}
			 Date re = null;
	            try {
	                re = dateFormat.parse(date);
	            } catch (ParseException e) {
	                throw new IllegalArgumentException("Erreur lors de la conversion de la date.");
	            }
	            Emprunt emp=Gestion.findEmpId(idEmp);
	            if(emp.getDateE().after(re)) {
	            	throw new IllegalArgumentException("Date de retour doit etre apres la date d'emprunt.");
	            }

	            emp.setDateR(re);
	            emp.setStatut("emprunter");
	            session.removeAttribute("idEmp");
	            session.setAttribute("success", "Date de retour enregistrée avec succès.");
	            response.sendRedirect(request.getContextPath() + "/Bib/Gestion");
			

		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/Bib/Gestion");
		}
	}

}
