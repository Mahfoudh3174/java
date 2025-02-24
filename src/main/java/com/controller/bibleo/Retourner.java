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
import com.model.Retour;

/**
 * Servlet implementation class Retourner
 */
@WebServlet("/Bib/Retourner")
public class Retourner extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Retourner() {
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
			String idRet=request.getParameter("idRet");
			if(idRet==null || !Gestion.isEmprunt(idRet)) {
				throw new IllegalArgumentException("Invalid Parametre");
			}
			session.setAttribute("idRet", idRet);
			request.getRequestDispatcher("/WEB-INF/bib/retourner.jsp").forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
			response.sendRedirect(request.getContextPath()+"/bib/Gestion");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		try {
			String idRet=(String) session.getAttribute("idRet");
			
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
	            Emprunt emp=Gestion.findEmpId(idRet);
	            
				
	            emp.setStatut("retourner");
	            
	            Retour retour=new Retour();
	            retour.setDateR(re);
	            retour.setIdEmp(idRet);
	            Gestion.retour(retour);
	            if(emp.getDateR().before(re)) {
	            	emp.setStatut("en retarde");
	            	
	            	throw new IllegalArgumentException("Le livre est En retarde ");
	            }
	            
					// TODO: handle exception
	            
	                

	            
	            session.removeAttribute("idEmp");
	            
	            session.setAttribute("success", "Retourner un temps.");
	            response.sendRedirect(request.getContextPath() + "/Bib/Gestion");
			

		} catch (IllegalArgumentException e) {
			// TODO: handle exception
			session.setAttribute("fail", e.getMessage());
            response.sendRedirect(request.getContextPath() + "/Bib/Gestion");
		}
	}

}
