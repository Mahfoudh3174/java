package com.controller.bibleo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.data.UserDB;
import com.model.User;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/Bib/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUser() {
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
				throw new IllegalArgumentException("Invalid Parameter");
			}
			User user=UserDB.findUserById(id);
			session.setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/bib/editUser.jsp").forward(request, response);
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
      	  
          // Validate Numero
          String numero = request.getParameter("numero");
          if (numero == null || numero.trim().isEmpty() || !UserDB.isUser(numero)) {
              throw new IllegalArgumentException("Invalid parametre.");
          }
          User user=UserDB.findUserById(numero);
          

          // Validate Nom
          String nom = request.getParameter("nom");
          if (nom == null || nom.trim().isEmpty() ) {
              throw new IllegalArgumentException("Nom ne peut pas etre vide.");
          }
          
          if(!nom.equals(user.getNom())) {
          if(!UserDB.isUnique(nom)) {
        	  throw new IllegalArgumentException("Nom est utilise par un autre utilisateur.");
          }
          user.setNom(nom);
          }
          

          // Validate Prenom
          String prenom = request.getParameter("prenom");
          if (prenom == null || prenom.trim().isEmpty()) {
              throw new IllegalArgumentException("Prenom ne peut pas etre vide.");
          }
          user.setPrenom(prenom);

          // Validate Email
          String email = request.getParameter("email");
          if (email == null || email.trim().isEmpty() || 
              !email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
              throw new IllegalArgumentException("email non valide.");
          }
          user.setEmail(email);



          
          UserDB.editUser(user);
      	session.setAttribute("success", "user editer avec success");
      	session.removeAttribute("user");
      	response.sendRedirect(request.getContextPath()+"/Bib/Users");

      } catch (IllegalArgumentException e) {
          session.setAttribute("fail", e.getMessage());
          response.sendRedirect(request.getContextPath()+"/Bib/Users");
      }
	}

}
